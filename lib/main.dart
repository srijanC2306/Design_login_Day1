import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srijan_sustam_design/Login/phone_verification.dart';

import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneVerification()
    );
  }


}
//
// class UserList extends StatefulWidget {
//
//
//
// UserList({Key? key }) : super(key: key);
//
//
//
//   @override
//   _UserListState createState() => _UserListState();
//
// }
//
// class _UserListState extends State<UserList> {
//
//   late DateTime birthDay ;
//   bool   isDateSelected = false ;
//   late String birthDateInString;
//   late Person person ;
//
//
//
//   String dob = "";
//   TextEditingController dateOfBirthController = TextEditingController();
//
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//
//     // dateOfBirthController.value = dateOfBirthController.value.copyWith(
//     //   text: widget.
//     //
//     //
//     // );
//   }
//
//   Future<Null> _selectDate(BuildContext context) async{
//     final DateTime?  picked = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         lastDate: DateTime(2100),
//         firstDate: DateTime(1900));
//     if(picked != null && picked!= birthDay){
//
//       setState(() {
//         birthDay = picked;
//         isDateSelected = true ;
//         dateOfBirthController.value = TextEditingValue(
//           text: DateFormat("yyyy-MM-dd").format(picked).toString()
//         );
//       });
//     }
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//       children: <Widget>[
//         Container(
//
//
//          child: Column(
//
//             children: const [
//               Text('Get Started',
//          textAlign: TextAlign.left, style: TextStyle(
//              color: Color.fromRGBO(0, 0, 0, 1),
//              fontFamily: 'Inter',
//              fontSize: 33,
//              letterSpacing: 0.25,
//              fontWeight: FontWeight.normal,
//              height: 1),),
//           Text("Suspendisse cras et amet, ornare et\n donec tellus pellentesque",
//               textAlign: TextAlign.left, style: TextStyle(
//                   color: Color.fromRGBO(158, 158, 158, 1),
//                   fontFamily: 'Inter',
//                   fontSize: 16,
//                   letterSpacing: 0.5,
//                   fontWeight: FontWeight.normal,
//                   height: 1.5
//               ),)
//           ],
//         ),
//         ),
//        SizedBox(height: 25),
//        Container(
//
//          width: MediaQuery.of(context).size.width,
//          margin: EdgeInsets.only(left: 20 , right: 20),
//          child: SafeArea(
//            child: Column(
//              children:  [
//                const TextField(
//                  decoration: InputDecoration(
//                    label: Text("First Name"),
//                    border: OutlineInputBorder(),
//
//                  ) ,
//
//                ),
//                SizedBox(height: 25),
//                TextFormField(
//
//                  decoration:  const InputDecoration(
//
//                    label: Text("Last Name"),
//                    border: OutlineInputBorder(),
//
//                  ) ,
//
//                ),
//                const SizedBox(height: 25),
//                TextFormField(
//                  controller: dateOfBirthController,
//                  decoration: InputDecoration(
//                    label: Text("Date Of Birth"),
//                    prefix:  GestureDetector(
//                        child:const Icon(Icons.calendar_today) ,
//                        onTap: () => _selectDate(context)
//
//                    ),
//
//
//                    border: OutlineInputBorder(),
//
//                  ) ,
//                ),
//               SizedBox(height: 25),
//                const TextField(
//                  decoration: InputDecoration(
//                    label: Text("Email ID"),
//                    border: OutlineInputBorder(),
//
//                  ) ,
//
//                ),
//                SizedBox(height: 25),
//                const TextField(
//                  decoration: InputDecoration(
//                    label: Text("Upload Your Resume"),
//                    border: OutlineInputBorder(),
//
//                  ) ,
//
//                ),
//
//                SizedBox(height: 25),
//                const TextField(
//                  decoration: InputDecoration(
//                    label: Text("Upload Your Picture"),
//                    border: OutlineInputBorder(),
//
//                  ) ,
//
//                ),
//                SizedBox(height: 25),
//                Container(
//                  width: 350,
//                  child: ElevatedButton(
//                     style: ButtonStyle(
//                       elevation: MaterialStateProperty.all<double>(0),
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.blue
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0)
//                         )
//                       )
//                     ),
//                    onPressed: (){
//                  Navigator.push(context , MaterialPageRoute(builder: (context)=> const UnderVerfication()));
//                }, child: const Text('Next   ->',
//                style: TextStyle(
//                  fontSize: 16
//                ),),),
//                color: Colors.blue,)
//
//              ],
//            ),
//
//          ),
//        )
//
//
//
//
//
//
//
//
//       ]
//     ),
//       ),
//     );
//   }
// }