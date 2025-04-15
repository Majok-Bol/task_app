//handle task list
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget{
  String taskName;
  bool taskCompleted;
  //toggle checkbox
  Function(bool?)?onChanged;
  Function(BuildContext)?deleteFunction;
  ToDoTile({super.key,required this.taskName,required this.taskCompleted,required this.onChanged,required this.deleteFunction});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children:[
          SlidableAction(onPressed: deleteFunction,icon: Icons.delete,backgroundColor: Colors.red,),
        ]),
          child: Container(
            color: Colors.yellow.shade200,
        padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Checkbox(value: taskCompleted, onChanged: onChanged),
                Text(taskName),
              ],
            ),

      )),




    );
  }

}