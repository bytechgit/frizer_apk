import 'package:flutter/material.dart';
import 'package:frizer/appointment.dart';
import 'package:frizer/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: Scaffold(
          body: home(),
        ));
  }
}
