import 'package:flutter/material.dart';

class termin extends StatefulWidget {
  const termin({Key? key}) : super(key: key);

  @override
  State<termin> createState() => _terminState();
}

class _terminState extends State<termin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          //   color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0)),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            '9:30 - 10:00',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
