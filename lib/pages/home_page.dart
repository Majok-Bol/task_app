//handle home page widget
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  @override
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Task App',style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Colors.purple,),
      body: ListView.builder(itemBuilder:(context,index){
        return ListTile();
      }),
      floatingActionButton: FloatingActionButton(onPressed:() {
      },backgroundColor: Colors.blue,child: Icon(Icons.add),),
    );
  }
}