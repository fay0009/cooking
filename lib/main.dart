import 'package:flutter/material.dart';
import 'model/user_Model.dart';
import 'bdd/mysql.dart';
import '/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter MySQL CRUD Demo'),
      home: Home(),
    );
  }
}


