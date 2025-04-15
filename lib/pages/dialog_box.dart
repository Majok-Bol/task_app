//handle dialog box
import 'package:flutter/material.dart';
import 'package:task_app/pages/buttons.dart';

class DialogBox extends StatelessWidget{
  //get text input
  final itemController;
  //function to run when save button is clicked

  VoidCallback onSave;
  //function to run when cancel button is pressed
  VoidCallback onCancel;
  DialogBox({super.key,required this.onSave,required this.onCancel,required this.itemController});
  @override
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: AlertDialog(
          content:Container(
            height: 120,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller:itemController ,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Add a new task'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Buttons(text: 'Save', onPressed:onSave,),
                  SizedBox(width: 20,),
                  Buttons(text: 'Cancel', onPressed: onCancel)



                ],)
              ],
            ),
          ),
        ),
      ),

    );


  }

}