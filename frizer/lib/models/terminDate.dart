import 'package:frizer/models/usluga.dart';

class TerminDate {
  int id = -1;
  int trajanje = 0;
  DateTime pocetak = DateTime(0);
  void setTermin(int minut, int sat, int trajanje) {
    pocetak = DateTime(0, 0, 0, sat, minut);
    this.trajanje = trajanje;
  }

  TerminDate(
      {required this.id,
      required int minut,
      required int sat,
      required this.trajanje}) {
    pocetak = DateTime(0, 0, 0, sat, minut);
  }
  TerminDate.def();
}
