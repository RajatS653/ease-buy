import 'package:ease_buy/Controllers/Auth_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Log_In.dart';
class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  final A_Controller = Get.put(Auth_Control());
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
                  Text("Sign up",
                      style: GoogleFonts.roboto(
                          fontSize: 34, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Center(
                    child: Text("with india's no.1 E-commerce app",
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
                          labelText: "New password",
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Color.fromARGB(255, 150, 10, 10),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
      
                     Padding(
                       padding: const EdgeInsets.only(left: 170),
                       child: InkWell(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(
                             builder: (context) {
                               return LogIn_Screen();
                             },
                           ));
                         },
                         child: Container(
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Already have an account?"),
                              Icon(
                                Icons.arrow_right_alt,
                                size: 25,
                                color: Color.fromARGB(255, 150, 10, 10),
                              )
                            ],
                    ),
                         ),
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
                          "Sign Up",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ))),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Center(child: Text("Or Sign Up with social account")),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        A_Controller.googleSignIn();
                      },
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
                  ),
               SizedBox(height: 20,),
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
