import 'package:ease_buy/Screens/Bottom_Nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn_Screen extends StatefulWidget {
  const LogIn_Screen({super.key});

  @override
  State<LogIn_Screen> createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10),
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back,",
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Center(
                    child: Text("On india's no.1 E-commerce app",
                        style: GoogleFonts.roboto(
                            fontSize: 18, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
                  ),
                  SizedBox(height: 40,),
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage("Assets/ease_buy_logo.png"), fit: BoxFit.fill)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 70,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,

                      cursorColor: Color.fromARGB(255, 150, 10, 10),
                      decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 0.5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 150, 10, 10),
                              )),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 0.5)),
                          labelText: "Phone number",
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Color.fromARGB(255, 150, 10, 10),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 70,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      cursorColor: Color.fromARGB(255, 150, 10, 10),
                      decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 0.5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 150, 10, 10),
                              )),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 0.5)),
                          labelText: "password",
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Color.fromARGB(255, 150, 10, 10),
                          )),
                    ),
                  ),
                ]
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 150, 10, 10)),
                  onPressed: () {

                  },
                  child: Center(
                      child: Text(
                        "Log In",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ))),
            ),
            SizedBox(
              height: 80,
            ),
            Center(child: Text("Or Log In with social account")),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 0.5),
                    image: DecorationImage(
                        image: AssetImage("Assets/Google_logo.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: Text(
                ''' By continuing, You agree to our
Terms of service & Privacy Policy''',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
