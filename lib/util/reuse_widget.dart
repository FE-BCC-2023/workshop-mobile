import 'package:flutter/material.dart';
 
class ReuseableWidget{
  static showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
 }


}