//handle database for the app
import 'package:hive_flutter/hive_flutter.dart';
class StoreDatabase{
  //initialize items in the task list
  List items=[];
  //reference box
  final myBox=Hive.box('my_database');
  //run this if its the first time to open the box
void createInitialData(){
  items=[
    ['Go to gym',false],
    ['Go to school',false],

  ];
}
//load data from the database if not the first time
void loadData(){
  items=myBox.get('items');

}
//update the database
void updateDatabase(){
  myBox.put('items', items);
}
}