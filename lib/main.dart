import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materialyou/views/home/cubit/mainCubit.dart';
import 'package:materialyou/views/home/views/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
              primary: CupertinoColors.quaternarySystemFill,
              brightness: Brightness.light)),
      home: BlocProvider(
          create: (context) => MainCubit(), child: const MainHome()),
    );
  }
}