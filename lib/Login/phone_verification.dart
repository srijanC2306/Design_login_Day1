import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:srijan_sustam_design/Login/login_screen.dart';

import '../home_screen.dart';


enum MobileVerificationState{
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE ,
}






class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {

  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE ;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance ;

  late String verificationId ;
  bool showLoading = false ;


  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {

    setState(() {
      showLoading = true ;
    });
    try{
      final authCredential  = await  _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false ;
      });

      if(authCredential.user != null){

        Navigator.push(context , MaterialPageRoute(builder: (context)=>HomeScreen()));
      }
    } on FirebaseAuthException catch(e){

      setState(() {
        showLoading = false;
      });

      // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(e.message)));
    }


  }






  getMobileFormWidget(context){
    return Column(
      children: [
        const Spacer(),
        // Row(
        //   children: [
        //     Container(
        //       child: CountryCodePicker(
        //        favorite: ['+91','INR'],
        //         showCountryOnly: false,
        //
        //
        //       ),
        //     ),
        //     TextField(
        //       controller: phoneController,
        //       decoration: const InputDecoration(
        //           hintText: "Phone Number"
        //       ),
        //     ),
        //   ],
        TextField(
          controller: phoneController,
          decoration: const InputDecoration(
              hintText: "Phone Number"
          ),
        ),



        const SizedBox(height: 16),
        FlatButton(onPressed: ()async{
          setState(() {
            showLoading = true;
          });
          await  _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential)async{
                setState(() {
                  showLoading = false ;
                });

              },
              verificationFailed:(verificationFailed) {
                setState(() {
                  showLoading = false ;
                });

                // _scaffoldKey.currentState.showSnackBar(
                //     SnackBar(content:Text(verificationFailed.message)));
              },
              codeSent: (verificationId , resendingToken)async {
                setState(() {
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId ;
                });
              },
              codeAutoRetrievalTimeout: (verficiationId)async{}
          );
        },

          child: Text("SEND"),
          color: Colors.blue,
          textColor: Colors.white,
        ),

        const Spacer(),
      ],
    );
  }
  getOtpFormWidget(context){

    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: otpController,
          decoration: const InputDecoration(
              hintText: "Enter OTP "
          ),
        ),
        const SizedBox(height: 16),
        FlatButton(onPressed: () async {
          PhoneAuthCredential phoneAuthCredential =
          PhoneAuthProvider
              .credential(verificationId: verificationId, smsCode: otpController.text);

          signInWithPhoneAuthCredential(phoneAuthCredential);

        },
            child: const Text("Verfy")),

        Spacer(),
      ],
    );


  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: _scaffoldKey,
        body: Container(
          child:showLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
              ? getMobileFormWidget(context)
              : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        )

    );
  }
}
