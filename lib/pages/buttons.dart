//handle buttons
import 'package:flutter/material.dart';
class Buttons extends StatelessWidget{
  //require text for button label
   final String text;
   //function to call on button press
   VoidCallback onPressed;
   Buttons({super.key,required this.text,required this.onPressed});


  @override
  Widget build(BuildContext context){
    return MaterialButton(color:Colors.blue.shade300,onPressed: onPressed,child:Text(text));
  }
}