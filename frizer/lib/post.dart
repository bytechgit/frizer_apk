import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class post extends StatefulWidget {
  const post({Key? key}) : super(key: key);

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
      child: Container(
        height: 200,
        width: 320,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://www.monaheights.co.uk/wp-content/uploads/2019/02/slider_1.jpg'),
                fit: BoxFit.cover),

            // color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 150, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  width: 170,
                  child: Text(
                    'Look great and save some money',
                    maxLines: 3,
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
