import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:materialyou/services/strogeservice.dart';
import 'package:materialyou/views/home/cubit/mainCubit.dart';
import 'package:materialyou/views/home/views/auth/view/auth_view.dart';
import 'package:materialyou/views/home/views/home/view/HomeView.dart';
import 'package:materialyou/views/home/views/main_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint(StorageService.instance.storage.read('jwt').toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
              primary: CupertinoColors.quaternarySystemFill,
              brightness: Brightness.light)),
      home: StorageService.instance.storage.read('jwt') == null ? const AuthView() : BlocProvider(create: (_) => MainCubit(), child: const HomeView(),),
    );
  }
}
