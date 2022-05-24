import 'package:flutter/material.dart';
import 'package:frizer/termin.dart';
import 'package:table_calendar/table_calendar.dart';

class appointment extends StatefulWidget {
  const appointment({Key? key}) : super(key: key);

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 216, 105, 142),
            height: 270,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      'Zakazivanje',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
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
                            style: TextStyle(
                                color: Color.fromARGB(255, 216, 105, 142),
                                fontSize: 20),
                          )),
                    ),
                    headerVisible: true,
                    daysOfWeekHeight: 25,
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
                    headerStyle: const HeaderStyle(
                        titleCentered: true,
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                        rightChevronIcon: Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                        titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        headerPadding: EdgeInsets.only(bottom: 25),
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        formatButtonVisible: false),
                    calendarStyle: const CalendarStyle(
                        markerDecoration: BoxDecoration(),
                        cellMargin: EdgeInsets.all(15),
                        selectedTextStyle:
                            TextStyle(fontSize: 20, color: Colors.white),
                        todayTextStyle:
                            TextStyle(fontSize: 20, color: Colors.white),
                        isTodayHighlighted: false,
                        defaultTextStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        weekendTextStyle:
                            TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Dostupni termini',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //   runSpacing: 4.0,
                // spacing: 10.0,
                children: [
                  termin(),
                  termin(),
                  termin(),
                  termin(),
                  termin(),
                  termin(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
