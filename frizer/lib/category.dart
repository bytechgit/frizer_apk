import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frizer/home.dart';
import 'package:frizer/models/usluga.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themed/themed.dart';

import 'models/termin.dart';

class category extends StatefulWidget {
  String image;
  Usluga usluga;
  category({
    Key? key,
    required this.usluga,
    required this.image,
  }) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  bool focus = false;
  bool selected = false;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final terminController = Get.find<Termin>();
    return InkWell(
      onTap: () {
        if (terminController.cont(widget.usluga)) {
          terminController.remove(widget.usluga);
        } else {
          terminController.add(widget.usluga);
        }
      },
      child: Obx(
        () => Container(
          height: 100,
          //width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            //color: Colors.white,
            color: terminController.cont(widget.usluga)
                ? Color.fromARGB(255, 137, 111, 75)
                : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: terminController.cont(widget.usluga)
                    ? Color.fromARGB(
                        255, 137, 111, 75) //Color.fromARGB(255, 137, 111, 75)
                    : Color.fromARGB(255, 250, 250, 250),
                width: 6),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
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
                        Obx(
                          () => Text(widget.usluga.naziv,
                              style: GoogleFonts.openSans(
                                  fontSize: 22,
                                  height: 1,
                                  fontWeight:
                                      terminController.cont(widget.usluga)
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
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
                        Obx(
                          () => Text(widget.usluga.cena.toString() + ' RSD',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight:
                                      terminController.cont(widget.usluga)
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                      ],
                    ),
                  ),
                ),

                //  child: Image.asset('images/styling.jpg', fit: BoxFit.cover)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
