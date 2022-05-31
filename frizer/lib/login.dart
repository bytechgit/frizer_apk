import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:frizer/forgotPassword.dart';
//import 'package:moj_majstor/LocalDatabase.dart';
//import 'package:moj_majstor/PhoneNumber.dart';
//import 'package:moj_majstor/SignUp.dart';
//import 'package:moj_majstor/models/User.dart';
//import 'Authentication.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:moj_majstor/Notification.dart' as FCM;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
//  UserAuthentication ua = UserAuthentication();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool showPassword = true;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  get ua => null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background2.png"), fit: BoxFit.cover),
        ),
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text('LOGIN',
                          style: GoogleFonts.trirong(
                              fontSize: 50, color: Colors.white)),
                    ),
                    Form(
                      key: formkey,
                      //autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailcontroller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.people),
                              ),
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "Unesite email"),
                                  EmailValidator(
                                      errorText:
                                          "Unesite validnu email adresu"),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextFormField(
                              controller: passwordcontroller,
                              obscureText: showPassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () => {
                                          setState(
                                            () => {
                                              showPassword = !showPassword,
                                            },
                                          )
                                        },
                                    icon: Icon(Icons.remove_red_eye)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Password",
                                prefixIcon: Icon(Icons.people),
                              ),
                              validator: MultiValidator(
                                [
                                  RequiredValidator(
                                      errorText: "Unesite lozinku"),
                                  MinLengthValidator(6,
                                      errorText:
                                          "Lozinka mora imati najmanje 8 karaktera"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 137, 111, 75),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () async {
                          if (formkey.currentState?.validate() == true) {
                            String result = await ua.Login(
                                email: emailcontroller.text,
                                password: passwordcontroller.text);

                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(result)));
                          }
                        },
                        child: Center(
                          child: Text(
                            "Login",
                            style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight
                                    .w500), /*const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold), */
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: RichText(
                        text: TextSpan(
                          //style: defaultStyle,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'FORGOT PASSWORD ?',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return const forgotPassword();
                                    }),
                                  );
                                },
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: 'Century'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: RichText(
                        text: TextSpan(
                          //style: defaultStyle,
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'New User?  ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return Container(); //const SignIn();
                                    }),
                                  );
                                },
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Foreground widget here

        /*  decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 18, 18, 18),
                    Color.fromARGB(255, 65, 64, 64)
                  ],
                ),
              ),  */
        // height: 300,
        // color: const Color.fromRGBO(255, 152, 0, 1),
        /*Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 160, left: 30),
                    child: Text(
                      'DOBRO DOŠLI',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.openSans(
                          fontSize: 43, color: Colors.white),
                    ),
                  ),
                  SafeArea(
                    child: IconButton(
                      onPressed: () => {Navigator.pop(context)},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ), */
      ),
    );
  }
}
