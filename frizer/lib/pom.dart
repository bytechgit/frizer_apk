import 'package:flutter/material.dart';

class pom extends StatefulWidget {
  const pom({Key? key}) : super(key: key);

  @override
  State<pom> createState() => _pomState();
}

class _pomState extends State<pom> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
