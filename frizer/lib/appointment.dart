import 'package:flutter/material.dart';
import 'package:frizer/hairdresser.dart';
import 'package:frizer/home.dart';
import 'package:frizer/login.dart';
import 'package:frizer/termin.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

class appointment extends StatefulWidget {
  const appointment({Key? key}) : super(key: key);

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  late DateTime _focusedDay;

  late DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 18, 18, 18),
            Color.fromARGB(255, 65, 64, 64)
          ],
        )),
        //color: Color.fromARGB(255, 18, 18, 18),
        height: 270,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => home()),
                    )
                  },
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
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
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
                hairdresser(),
                hairdresser(),
                hairdresser(),
                hairdresser(),
                hairdresser(),
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
              termin(),
              termin(),
              termin(),
              termin(),
              termin(),
              termin()
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
            width: 380,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                );
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                child: Text('Zakažite termin',
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.white,
                    ) //TextStyle(fontSize: 18),
                    ),
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
    ]));
  }
}
