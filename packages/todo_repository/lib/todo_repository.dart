// import 'package:todo_models/todo_models.dart';
// import 'package:todo_services/data_models/dbtodo.dart';
// import 'package:todo_services/database.dart';

// class TodoRepository {
//   Future<void> addTodo(TodoModel todo) async {
//     await DBProvider.db.addTodo(DBTodo(
//       id: todo.id,
//       title: todo.title,
//       description: todo.description,
//     ));
//   }

//   Future<List<TodoModel>> getAllTodo() async {
//     final tt = await DBProvider.db.getAllTodo();
//     return tt
//         .map((e) => TodoModel(
//               id: e.id,
//               title: e.title,
//               description: e.description,
//             ))
//         .toList();
//   }
//   Future<void> deleteTodoId(int id) async {
//     await DBProvider.db.deleteTodoId(id);
//   }
// }
