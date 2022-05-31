import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frizer/hairdresser.dart';
import 'package:frizer/models/terminDate.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frizer/termin.dart';

import 'models/termin.dart';

class appointment extends StatefulWidget {
  const appointment({Key? key}) : super(key: key);

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  late DateTime _focusedDay;
  final terminController = Get.find<Termin>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 18, 18, 18),
                Color.fromARGB(255, 65, 64, 64)
              ],
            ),
          ),
          //color: Color.fromARGB(255, 18, 18, 18),
          height: 270,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      'Nazad',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: TableCalendar(
                  calendarBuilders: CalendarBuilders(
                    selectedBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(7.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 137, 111, 75),
                            fontSize: 20,
                          ),
                        )),
                  ),
                  headerVisible: true,
                  daysOfWeekHeight: 20,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarFormat: CalendarFormat.week,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  selectedDayPredicate: (day) {
                    return isSameDay(terminController.datum, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      terminController.datum = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
                    });
                  },
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle:
                        TextStyle(color: Color.fromARGB(255, 137, 111, 75)),
                    weekendStyle:
                        TextStyle(color: Color.fromARGB(255, 137, 111, 75)),
                  ),
                  headerStyle: const HeaderStyle(
                      titleCentered: true,
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontFamily: 'OpenSans'),
                      headerPadding: EdgeInsets.only(bottom: 25),
                      formatButtonTextStyle: TextStyle(color: Colors.white),
                      formatButtonVisible: false),
                  calendarStyle: const CalendarStyle(
                      outsideTextStyle:
                          TextStyle(fontSize: 20, color: Colors.white),
                      markerDecoration: BoxDecoration(),
                      cellMargin: EdgeInsets.all(1),
                      todayTextStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Montserrat'),
                      isTodayHighlighted: false,
                      defaultTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Montserrat'),
                      weekendTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Montserrat')),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'IZABERITE FRIZERA',
              style: GoogleFonts.montserrat(
                fontSize: 21,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  hairdresser(
                    id: 1,
                    photo:
                        'https://content.thriveglobal.com/wp-content/uploads/2018/11/chelseawebb.jpg',
                    name: 'MARIJA',
                  ),
                  hairdresser(
                      id: 2,
                      photo:
                          'https://t4.ftcdn.net/jpg/03/30/25/97/360_F_330259751_tGPEAq5F5bjxkkliGrb97X2HhtXBDc9x.jpg',
                      name: 'IVANA'),
                  hairdresser(
                    id: 3,
                    photo:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE0J0wlBFFP9Lf9eXY8UQ0rcx9-ViEJV5CKo5Ban59wREHnwdeXmviT-DzFXkBT2SI8Zc&usqp=CAU',
                    name: 'JOVANA',
                  ),
                  hairdresser(
                      id: 4,
                      photo:
                          'https://t4.ftcdn.net/jpg/02/46/34/43/360_F_246344306_E4KQf8mvvWsCAwrSMEEY6GUOa22TjiUn.jpg',
                      name: 'ANA'),
                  hairdresser(
                    id: 5,
                    photo:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGWL5kpmqBrynH-nkc2VcJnSAW27nmUoI0XX32EEmUY1UDERkSYT-YUPCRSbpVqvZczbw&usqp=CAU',
                    name: 'KRISTINA',
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'DOSTUPNI TERMINI',
              style: GoogleFonts.montserrat(
                fontSize: 21,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ), //TextStyle(fontSize: 25, color: Colors.black87),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                termin(
                  termin_vreme:
                      TerminDate(sat: 8, minut: 15, trajanje: 30, id: 1),
                ),
                termin(
                  termin_vreme:
                      TerminDate(sat: 8, minut: 15, trajanje: 30, id: 2),
                ),
                termin(
                  termin_vreme:
                      TerminDate(sat: 8, minut: 15, trajanje: 30, id: 3),
                ),
                termin(
                  termin_vreme:
                      TerminDate(sat: 8, minut: 15, trajanje: 30, id: 4),
                ),
                termin(
                  termin_vreme:
                      TerminDate(sat: 8, minut: 15, trajanje: 30, id: 5),
                ),
                termin(
                  termin_vreme:
                      TerminDate(sat: 8, minut: 15, trajanje: 30, id: 6),
                )
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 137, 111, 75),
                    Color.fromARGB(255, 137, 111, 75)
                  ],
                )),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: Text('Zakažite termin',
                    style: GoogleFonts.openSans(
                      fontSize: 22,
                      color: Colors.white,
                    ) //TextStyle(fontSize: 18),
                    ),
                style: TextButton.styleFrom(
                  primary: Colors.transparent,
                  // backgroundColor: Color.fromARGB(255, 137, 111, 75),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
