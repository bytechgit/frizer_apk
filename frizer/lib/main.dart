import 'package:flutter/material.dart';
import 'package:frizer/homepage.dart';
import 'package:get/get.dart';

import 'models/termin.dart';

void main() {
  final filterController = Get.put(Termin());
  runApp(const HomePage());
}
