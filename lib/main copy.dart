// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_learn_test/screens/lab2_navigation.dart';
// import 'package:flutter_learn_test/screens/sum_sum_screen.dart';
//
// import 'bloc/counter_bloc/counter_ui_bloc.dart';
// import 'bloc/todos/features/todo/todo_cubit.dart';
// import 'bloc/todos/features/todo/todo_name_view.dart';
// import 'bloc/todos/features/todo/todo_repository_impl.dart';
// import 'bloc/todos/todo_bloc_observer.dart';
// import 'clock/clock.dart';
//
// void main() {
//   BlocOverrides.runZoned(
//         () => runApp(const MyApp()),
//     blocObserver: TodoBlocObserver(),
//   );
//   // () => runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Bloc Tutorial",
//       home: BlocProvider(
//         create: (context) => TodoCubit(TodoRepositoryImpl()),
//         child: const TodoNameView(),
//       ),
//       // home: CounterUiBloc(),
//     );
//   }
// }