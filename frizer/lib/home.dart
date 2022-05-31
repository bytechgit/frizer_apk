import 'package:flutter/material.dart';
import 'package:frizer/appointment.dart';
import 'package:frizer/login.dart';
import 'package:frizer/models/usluga.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frizer/post.dart';
import 'package:frizer/category.dart';

import 'chat.dart';

import 'models/termin.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    final terminController = Get.find<Termin>();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              Column(
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
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const chat()),
                                );
                              },
                              child: post()),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const login()),
                                );
                              },
                              child: post()),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const appointment()),
                                );
                              },
                              child: post()),
                          post()
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 40, 0, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Usluge',
                        style: GoogleFonts.openSans(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 6.0, right: 6.0),
                      child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          padding: EdgeInsets.only(bottom: 70),
                          children: [
                            category(
                              image:
                                  'https://setatime.co/blog/wp-content/uploads/2019/01/women-haircut-hairstylist-scissors-wet-hair-600x400.jpg',
                              usluga: Usluga('Šišanje', 1200, 1),
                            ),
                            category(
                              image:
                                  'https://www.miladypro.com/home/resized-image/__size/1040x0/__key/communityserver-blogs-components-weblogfiles/00-00-00-00-32/BlowDryBar.jpg',
                              usluga: Usluga('Feniranje', 1200, 2),
                            ),
                            category(
                              image:
                                  'https://www.houseofwellness.com.au/wp-content/uploads/2019/02/HOW-hair-care-tips-MAIN.jpg',
                              usluga: Usluga('Lokne', 1200, 3),
                            ),
                            category(
                              image:
                                  'https://thumbs.dreamstime.com/b/hair-salon-coloring-roots-37459762.jpg',
                              usluga: Usluga('Farbanje', 1200, 4),
                            ),
                            category(
                              image:
                                  'https://www.mirrorsbeautylounge.com/mirror-admin/public/images/categories/Protein%20hair%20treatments%20mobile.jpg',
                              usluga: Usluga('Pranje kose', 1200, 5),
                            ),
                            category(
                              image:
                                  'https://media.istockphoto.com/photos/business-woman-lady-boss-in-beauty-salon-making-hairdress-and-looking-picture-id1147811403?k=20&m=1147811403&s=612x612&w=0&h=lBbmmhPxES33OgnJgkzvtURRSs_gRvD7kX65gETQ9r8=',
                              usluga: Usluga('Frizura', 1200, 6),
                            ),
                            category(
                              image:
                                  'https://cdn.britannica.com/53/136653-050-E8AE6706/Hairdresser-curling-iron.jpg',
                              usluga: Usluga('Feniranje', 1200, 7),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              if (terminController.usluge.isNotEmpty)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 60,
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
                                  Obx(
                                    () => Text(
                                      terminController.usluge.length
                                              .toString() +
                                          ' usluga',
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight
                                              .w500), /*const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold), */
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),
                              Obx(
                                () => Text(
                                  terminController.cena.value.toString() +
                                      ' RSD',
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
