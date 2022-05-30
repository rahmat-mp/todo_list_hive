import 'package:flutter/material.dart';
import 'package:todo_list_hive/hive/boxes.dart';
import 'package:todo_list_hive/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Boxes.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(),
    );
  }
}
