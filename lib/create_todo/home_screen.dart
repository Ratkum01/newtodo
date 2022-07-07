import 'package:flutter/material.dart';
import 'package:todo_list2/create_todo/create_todo.dart';
import 'package:todo_models/todo_models.dart';
import 'package:todo_repository/todo_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: TodoRepository().getAllTodo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final todo = snapshot.data as List<TodoModel>;
            return ListView.builder(
                itemCount: todo.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Card(
                                child: ListTile(
                              title: Text(
                                todo[index].title,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    TodoRepository().deleteTodoId(todo[index].id);
                                  });
                                },
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                              ),
                              subtitle:  Text(todo[index].description),
                            )),
                          ),
                        )
                      ],
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateTodo()));
        },
        child: const Icon(Icons.create),
      ),
    );
  }
}
