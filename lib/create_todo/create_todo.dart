import 'package:flutter/material.dart';
import 'package:todo_models/todo_models.dart';
import 'package:todo_repository/todo_repository.dart';



// ignore: must_be_immutable
class CreateTodo extends StatelessWidget{
  
  TextEditingController teTitile= TextEditingController();
  TextEditingController teDescription = TextEditingController();

  CreateTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('This is TODO'), centerTitle:  true,),
      body: Column(
        children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
          left: 15,
          right: 15,
          ),
          child: TextField(
            controller: teTitile,
            decoration: const InputDecoration(
              hintText: 'Task name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)
                )
              )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10,
          left: 15,
          right: 15,
          ),
          child: TextField(
            controller: teDescription,
            decoration: const InputDecoration(
              hintText: 'Task time',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)
                )
              )
            ),
          ),
        ),
        Container(
          width:  double.infinity,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          margin: const EdgeInsets.all(15), 
          child: ElevatedButton(
            onPressed: (){ 
              final todo = TodoModel(
                id: 1 , title: teTitile.text, description: teDescription.text,);
                 TodoRepository().addTodo(todo);
                 Navigator.pop(context);
            },
            child: const  Text('SAVE'),

          ),
        )
      ],),
    );
  }

}
