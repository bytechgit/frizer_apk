import 'dart:developer';

import 'package:frizer/models/terminDate.dart';
import 'package:frizer/models/usluga.dart';
import 'package:get/get.dart';

class Termin extends GetxController {
  var frizer = (-1).obs;
  DateTime datum = DateTime.now();
  var termin = TerminDate.def().obs;
  List usluge = [].obs;
  bool cont(Usluga u) {
    for (int i = 0; i < usluge.length; i++) {
      if (usluge[i].id == u.id) {
        return true;
      }
    }
    return false;
  }

  bool remove(Usluga u) {
    for (int i = 0; i < usluge.length; i++) {
      if (usluge[i].id == u.id) {
        usluge.removeAt(i);
        cena.value -= u.cena;
        return true;
      }
    }
    return false;
  }

  void add(Usluga u) {
    usluge.add(u);
    cena.value += u.cena;
  }

  var cena = (0.0).obs;
}
