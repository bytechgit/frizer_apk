import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frizer/post.dart';
import 'package:frizer/category.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text('Home',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500)),
            )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [post(), post(), post(), post()],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Usluge',
                  style: GoogleFonts.montserrat(
                      fontSize: 23, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: Wrap(children: [
                    category(),
                    category(),
                    category(),
                    category(),
                    category(),
                    category(),
                    category(),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                // height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 137, 111, 75),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () async {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Zakaži:",
                              style: GoogleFonts.openSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight
                                      .w500), /*const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold), */
                            ),
                            Text(
                              "1 usluga",
                              style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight
                                      .w500), /*const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold), */
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Text(
                          '1.000,00 RSD',
                          style: GoogleFonts.openSans(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
