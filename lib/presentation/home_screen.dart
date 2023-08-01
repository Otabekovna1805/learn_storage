import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_storage/core/service_locator.dart';
import 'package:learn_storage/domain/model/todo.dart';

import 'detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [];
  String data = "No data";

  @override
  void initState() {
    super.initState();
    getAllTodos();
  }

  void getAllTodos() async {
    todos = repository.readTodo();
    setState(() {});
  }

  void detailPagePush() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreatedTodosPage(length: todos.length)));
  }

  void delate({required Todo todo}) async {
    bool result = await repository.delateTodo(todo);
    debugPrint(result.toString());
    getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: detailPagePush,
        child: const Icon(Icons.add),
      ),
      body: todos.isNotEmpty
          ? ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, i) {
                final todo = todos[i];
                debugPrint("====>${todos}<=====");
                return Card(
                  child: ListTile(
                    leading: Text("${todo.id}"),
                    title: Text(
                      todo.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      todo.description,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    trailing: IconButton(
                      onPressed: () => delate(todo: todo),
                      icon: const Icon(CupertinoIcons.delete),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                data,
                style: const TextStyle(fontSize: 30),
              ),
            ),
    );
  }
}
