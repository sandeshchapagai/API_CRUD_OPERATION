import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils {
  static void fieldFocusChange(BuildContext context,
      FocusNode current,
      FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }



  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message,backgroundColor: Colors.red);
  }

  static flushBarErrorMessage(String message,BuildContext context){
       showFlushbar(context: context, flushbar: Flushbar(
         reverseAnimationCurve: Curves.easeIn,
         margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
         forwardAnimationCurve: Curves.decelerate,
         message: message,
         // title: "No connection",
         backgroundColor: Colors.red,
         messageColor: Colors.white,
         positionOffset: 20,
         icon: Icon(Icons.error),
         duration: Duration(seconds: 3),
         flushbarPosition: FlushbarPosition.TOP,

       )..show(context));
  }


  static snakBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
}
