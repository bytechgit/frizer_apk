import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'models/termin.dart';
import 'models/terminDate.dart';

class termin extends StatefulWidget {
  TerminDate termin_vreme;
  termin({
    Key? key,
    required this.termin_vreme,
  }) : super(key: key);

  @override
  State<termin> createState() => _terminState();
}

class _terminState extends State<termin> {
  final terminController = Get.find<Termin>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: InkWell(
        onTap: () async {
          setState(() {
            inspect(terminController);
            if (terminController.termin.value != widget.termin_vreme) {
              terminController.termin.value = widget.termin_vreme;
            } else {
              terminController.termin.value = TerminDate.def();
            }
          });
        },
        child: Obx(
          () => Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: widget.termin_vreme.id == terminController.termin.value.id
                  ? Color.fromARGB(255, 65, 64, 64)
                  : Colors.grey[50],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              border: Border.all(
                color:
                    widget.termin_vreme.id == terminController.termin.value.id
                        ? Color.fromARGB(255, 137, 111, 75)
                        : Colors.grey,
                width: 1,
              ),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  DateFormat.Hm().format(widget.termin_vreme.pocetak) +
                      '-' +
                      DateFormat.Hm().format(widget.termin_vreme.pocetak.add(
                          Duration(minutes: widget.termin_vreme.trajanje))),
                  style: GoogleFonts.montserrat(
                      color: widget.termin_vreme.id ==
                              terminController.termin.value.id
                          ? Colors.white
                          : Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
