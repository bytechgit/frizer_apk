import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/termin.dart';

class hairdresser extends StatefulWidget {
  int id;
  String photo;
  String name;
  hairdresser(
      {Key? key, required this.id, required this.photo, required this.name})
      : super(key: key);

  @override
  State<hairdresser> createState() => _hairdresserState();
}

class _hairdresserState extends State<hairdresser> {
  final terminController = Get.find<Termin>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
              width: 170,
              height: 170,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      //  height: 70,
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      color: Color.fromARGB(255, 18, 18, 18).withOpacity(.3),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          widget.name,
                          style: GoogleFonts.gabriela(
                              color: Colors
                                  .white, // Color.fromARGB(255, 137, 111, 75),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: terminController.frizer.value == widget.id
                                  ? Color.fromARGB(255, 137, 111,
                                      75) //Color.fromARGB(255, 137, 111, 75)
                                  : Color.fromARGB(255, 250, 250, 250),
                              width: 5),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Ink.image(
                        image: NetworkImage(widget.photo),
                        fit: BoxFit.cover,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () async {
                            inspect(terminController);
                            if (terminController.frizer == widget.id) {
                              terminController.frizer.value = -1;
                            } else {
                              terminController.frizer.value = widget.id;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
