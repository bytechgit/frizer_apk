import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class hairdresser extends StatefulWidget {
  const hairdresser({Key? key}) : super(key: key);

  @override
  State<hairdresser> createState() => _hairdresserState();
}

class _hairdresserState extends State<hairdresser> {
  bool focus = false;

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
                          'MARIJA ',
                          style: GoogleFonts.gabriela(
                              color: Colors
                                  .white, // Color.fromARGB(255, 137, 111, 75),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: focus
                                ? Color.fromARGB(255, 137, 111,
                                    75) //Color.fromARGB(255, 137, 111, 75)
                                : Color.fromARGB(255, 255, 250, 250),
                            width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Ink.image(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdBcBANYX49vuhaEe8ZT05sfh7WijLu78ZaA&usqp=CAU',
                      ),
                      fit: BoxFit.cover,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () async {
                          setState(() {
                            focus = !focus;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
