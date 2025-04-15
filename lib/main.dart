import 'package:flutter/material.dart';
import 'package:task_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  await Hive.initFlutter();
  //open box
  //ie data
  var box=await Hive.openBox('my_database');

  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}