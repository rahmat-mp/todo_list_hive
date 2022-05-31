import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_hive/constants/colors.dart';
import 'package:todo_list_hive/hive/boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_hive/model/note.dart';
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
