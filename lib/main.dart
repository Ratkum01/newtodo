
import 'package:flutter/material.dart';
import 'package:todo_list2/create_todo/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData( 
          primarySwatch: Colors.red, 
        ),
        // home: Scaffold(
        //     appBar: AppBar(
        //   // ignore: prefer_const_constructors
        //   title: Text(
        //     'TODO',
        //     style: TextStyle(
        //         color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold), 
        //   ),centerTitle:true, backgroundColor: Colors.white,
        // )

            home: const HomeScreen()
            );
  }
}
