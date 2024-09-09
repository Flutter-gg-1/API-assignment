import 'dart:convert';

import 'package:api_assignment/models/todo.dart';
import 'package:api_assignment/networking/api_constants.dart';
import 'package:http/http.dart' as http;


mixin TodoApiClient on ApiConstants{

  Future<List<Todo>> getAllTodos() async {
    final response = await http.get(Uri.parse('$baseurl$todosEndpoint'));

    List todosData =
        List.from(jsonDecode(response.body)).cast<Map<String, dynamic>>();

    List<Todo> todos = [];

    for (var todo in todosData) {
      todos.add(Todo.fromJson(todo));
    }
    return todos;
  }
}