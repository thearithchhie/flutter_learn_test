import 'package:flutter_learn_test/bloc/todos/features/todo/todo_service.dart';

import 'data_model.dart';

class TodoRepositoryImpl implements TodoRepository {

  TodoService service = TodoService();

  @override
  Future<List<Data>> fetchData(){
   return service.fetchData();
  }

}

abstract class TodoRepository {
  Future<List<Data>> fetchData();
}