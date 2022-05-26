import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learn_test/bloc/todos/features/todo/todo_repository_impl.dart';

import 'data_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
    final TodoRepository _todoRepository;

  TodoCubit(this._todoRepository) : super(TodoInitial());

  Future<void> getData() async {
    try {
      List<Data> data = await _todoRepository.fetchData();
      emit(TodoLoaded(data: data));
    } on Exception {
      emit(TodoError(message: "Could not fetch the list, please try again later!"));
    }
  }
}