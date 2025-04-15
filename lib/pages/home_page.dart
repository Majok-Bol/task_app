//handle home page widget
import 'package:flutter/material.dart';
import 'package:task_app/pages/dialog_box.dart';
import 'package:task_app/pages/to_do_tile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{

//store task items
  List items=[
    ['Go to gym',false],
    ['Go to school',false],

  ];
  //access the text field input
  final TextEditingController _taskController=TextEditingController();
  //function to create new task
  void addNewTask(){
 setState(() {
   showDialog(context: context, builder: (context){
     return DialogBox(onSave:saveNewTask, onCancel:()=>Navigator.of(context).pop(), itemController:_taskController);

   });
 });
  }
  //function to save new task
  void saveNewTask(){
    setState(() {
      items.add([_taskController.text,false]);
      _taskController.clear();

    });

    Navigator.of(context).pop();
  }
  //function to delete items
  void deleteTask(int index){
    setState(() {
      items.removeAt(index);
    });


  }
  //function to toggle check box
  void checkBoxChanged(bool?value,int index){
    setState(() {
      items[index][1]=!items[index][1];
    });
   

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Task App'),centerTitle: true,backgroundColor: Colors.blue,),
      body: ListView.builder(
        itemCount: items.length,
          itemBuilder:(context,index){
        return ToDoTile(taskName:items[index][0], taskCompleted:items[index][1], onChanged:(value)=>checkBoxChanged(value, index), deleteFunction:(context)=>deleteTask(index));
      }),
      floatingActionButton: FloatingActionButton(onPressed:addNewTask,backgroundColor: Colors.blue,child: Icon(Icons.add),),
    );
  }
}