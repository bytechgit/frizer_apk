import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frizer/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themed/themed.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  bool focus = false;
  bool selected = false;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
      child: InkWell(
        onTap: () async {
          setState(() {
            focus = !focus;
            selected = !selected;
          });
        },
        child: Container(
          height: 170,
          width: 190,
          decoration: BoxDecoration(
            //color: Colors.white,
            color: focus ? Color.fromARGB(255, 137, 111, 75) : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: focus
                    ? Color.fromARGB(
                        255, 137, 111, 75) //Color.fromARGB(255, 137, 111, 75)
                    : Color.fromARGB(255, 250, 250, 250),
                width: 6),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    image: const AssetImage("images/styling.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 18, 18, 18).withOpacity(.35),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),

                  //  height: 70,
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Feniranje',
                          style: GoogleFonts.openSans(
                              fontSize: 22,
                              height: 1,
                              fontWeight:
                                  focus ? FontWeight.bold : FontWeight.w500,
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1.000,00 RSD',
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight:
                                  focus ? FontWeight.bold : FontWeight.w500,
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ],
                  ),
                ),
              ),

              //  child: Image.asset('images/styling.jpg', fit: BoxFit.cover)),
            ],
          ),
        ),
      ),
    );
  }
}
