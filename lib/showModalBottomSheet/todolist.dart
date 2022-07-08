import 'package:flutter/material.dart';
import './todoitem.dart';
import 'classes/todo.dart';

class ToDoList extends StatelessWidget{

  final List<ToDo> _todos;
  final Function _deleteToDo;
  final Function _editTodo;

  const ToDoList(this._todos, this._editTodo, this._deleteToDo, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: _todos.length,
      padding: const EdgeInsets.only(bottom: 120),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = _todos[index];
        return ToDoItem(item, _editTodo, _deleteToDo);
      },
    );
  }
}