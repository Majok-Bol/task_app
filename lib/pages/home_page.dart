//handle home page widget
import 'package:flutter/material.dart';
import 'package:task_app/pages/dialog_box.dart';
import 'package:task_app/pages/to_do_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/task_database/database.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{
  //reference the box
  final myBox=Hive.box('my_database');
  //initial the database
  StoreDatabase db=StoreDatabase();
  //build the database
  @override
  void initState() {
    if(myBox.get('items')==null){
      //if not initial data
      //create initial data
      db.createInitialData();
    }else{
      //if there is already data
      //load the database
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }


// //store task items
//   List items=[
//     ['Go to gym',false],
//     ['Go to school',false],
//
//   ];
  //access the text field input
  final TextEditingController _taskController=TextEditingController();
  //function to create new task
  void addNewTask(){
 setState(() {
   showDialog(context: context, builder: (context){
     return DialogBox(onSave:saveNewTask, onCancel:()=>Navigator.of(context).pop(), itemController:_taskController);

   });
 });
 //update the database
    db.updateDatabase();
  }
  //function to save new task
  void saveNewTask(){
    setState(() {
      db.items.add([_taskController.text,false]);
      _taskController.clear();

    });

    Navigator.of(context).pop();
    //update the database
    db.updateDatabase();
  }
  //function to delete items
  void deleteTask(int index){
    setState(() {
      db.items.removeAt(index);
    });
    //update the database
    db.updateDatabase();


  }
  //function to toggle check box
  void checkBoxChanged(bool?value,int index){
    setState(() {
      db.items[index][1]=!db.items[index][1];
    });
    //update the database
    db.updateDatabase();
   

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Task App'),centerTitle: true,backgroundColor: Colors.blue,),
      body: ListView.builder(
        itemCount: db.items.length,
          itemBuilder:(context,index){
        return ToDoTile(taskName:db.items[index][0], taskCompleted:db.items[index][1], onChanged:(value)=>checkBoxChanged(value, index), deleteFunction:(context)=>deleteTask(index));
      }),
      floatingActionButton: FloatingActionButton(onPressed:addNewTask,backgroundColor: Colors.blue,child: Icon(Icons.add),),
    );
  }
}