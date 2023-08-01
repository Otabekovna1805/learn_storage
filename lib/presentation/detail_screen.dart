
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_storage/core/service_locator.dart';
import 'package:learn_storage/domain/model/todo.dart';

import 'home_screen.dart';

class CreatedTodosPage extends StatefulWidget {
  final int length;
  const CreatedTodosPage({Key? key, required this.length})
      : super(key: key);

  @override
  State<CreatedTodosPage> createState() => _CreatedTodosPageState();
}

class _CreatedTodosPageState extends State<CreatedTodosPage> {
  TextEditingController controlTitle = TextEditingController();
  TextEditingController controlDescription = TextEditingController();
  TextEditingController controlImageUrl = TextEditingController();
  int count = 0;

  void createdTodos() async {
    String title = controlTitle.value.text.trim();
    String description = controlDescription.value.text.trim();
    String imageUrl = controlImageUrl.value.text.trim();
    if (title.isEmpty || description.isEmpty || imageUrl.isEmpty) {
      return;
    }
    await repository.storeTodo(Todo(id: widget.length + 1,title: title, description: description, imageUrl: imageUrl));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()));
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Created todos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createdTodos,
        child: const Icon(Icons.check),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextField(
                    controller: controlTitle,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        label: Text("Title",style: TextStyle(fontSize: 16,color: Colors.black),)),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: controlDescription,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        label: Text("Description",style: TextStyle(fontSize: 16,color: Colors.black),)),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: controlImageUrl,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        label: Text("ImageUrl",style: TextStyle(fontSize: 16,color: Colors.black),)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

