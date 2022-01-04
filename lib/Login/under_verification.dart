
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnderVerfication extends StatelessWidget {
  const UnderVerfication({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(

       child: Column(
         children: [
           Container(
             padding: EdgeInsets.all(10),
             child: Column(
               children: const <Widget>[
                 Text("Under Verification",
                 style: TextStyle(
                   fontSize: 40,
                   fontWeight: FontWeight.bold,
                   color: Colors.black ,
                 ),)
               ],
             ),
           ),

           Container(

             child: Column(
               children: const <Widget>[
                 Text("Suspendisse cras et amet, ornare et\n donec tellus pellentesque.",
                   style: TextStyle(
                       fontFamily: 'Inter',
                       fontSize: 16,
                       letterSpacing: 0.5,
                       fontWeight: FontWeight.normal,
                       height: 1.5
                   ),)
               ],
             ),
           ),
          Spacer(),
           Container(
             margin: EdgeInsets.symmetric(vertical: 40),
             width: 250,
             child:Center(
             child: ElevatedButton(
               style: ButtonStyle(
                   elevation: MaterialStateProperty.all<double>(0),

                   backgroundColor: MaterialStateProperty.all<Color>(
                       Colors.grey
                   ),
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12.0)
                       )
                   )
               ),
               onPressed: (){

               }, child: const Text('Refresh St',
               style: TextStyle(
                   fontSize: 16
               ),),),),
             color: Colors.grey,),
           Spacer(),
         ],
       ),
     )
    );

    }
}