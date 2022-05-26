import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class termin extends StatefulWidget {
  const termin({Key? key}) : super(key: key);

  @override
  State<termin> createState() => _terminState();
}

class _terminState extends State<termin> {
  bool focus = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: InkWell(
        onTap: () async {
          setState(() {
            focus = !focus;
          });
        },
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: focus ? Color.fromARGB(255, 137, 111, 75) : Colors.grey[50],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
            border: Border.all(
              color: focus ? Color.fromARGB(255, 137, 111, 75) : Colors.grey,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              '9:30 - 10:00',
              style: GoogleFonts.montserrat(
                  color: focus ? Colors.white : Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
