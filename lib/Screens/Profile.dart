import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  List Features = [
    "My Orders",
    "Shipping Addresses",
    "Payment Methods",
    "Promo Codes",
    "My Reviews",
    "Settings",
    "Logout"
  ];
  List SubTitles = [
    "Already have 12 orders",
    "3 Addresses",
    "Visa **34",
    "You have special promo codes",
    "Reviews for 5 items",
    "Notifications, Password",
    ""
  ];


  File? file;
  GetImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      setState(() {
        file = File(value!.path);
      });
    });
  }

  Future<void> LogOut() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(msg: 'Logged Out',textColor: Colors.white, backgroundColor: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 55,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
            0.01,
            0.89,
          ],
              colors: [
            Color.fromARGB(255, 150, 10, 10),
            Colors.black,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 675,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 0.5)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              file == null
                                  ? Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 0.5),
                                          shape: BoxShape.circle),
                                    )
                                  : Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.black, width: 0.5),
                                          image: DecorationImage(
                                              image: FileImage(file!),
                                              fit: BoxFit.fill)),
                                    ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 55, left: 55),
                                child: InkWell(
                                    onTap: () {
                                      GetImage();
                                    },
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Color.fromARGB(255, 150, 10, 10),
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Rajat Saluja",
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "salujarajat653@gmail.com",
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 490,
                            child: ListView.separated(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      switch(index){
                                        case 0:{
                                          print(0);
                                          break;
                                        }

                                        case 1:{
                                          print(1);
                                          break;
                                        }

                                        case 2:{
                                          print(2);
                                          break;
                                        }

                                        case 3:{
                                          print(3);
                                          break;
                                        }

                                        case 4:{
                                          print(4);
                                          break;
                                        }

                                        case 5:{
                                          print(5);
                                          break;
                                        }

                                        case 6:{
                                          print(6);
                                          showDialog(context: context, builder: (context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.white,
                                              title: Text("Alert", style: TextStyle(color: Colors.red),),
                                              content: Text(
                                                "Are you sure to Log out ?",
                                                style: GoogleFonts.jost(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Cancel",
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.green,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 16),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                        LogOut();

                                                    },
                                                    child: Text("Ok",
                                                        style: GoogleFonts.roboto(
                                                            color: Colors.red,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16))),
                                              ],
                                            );
                                          },);


                                          break;
                                        }

                                      }
                                    },
                                    child: ListTile(
                                      title: Text(
                                        Features[index].toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Text(
                                        SubTitles[index].toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      trailing: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 25,
                                        color: Color.fromARGB(255, 150, 10, 10),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: 0.5,
                                    color: Colors.grey,
                                  );
                                },
                                itemCount: Features.length),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
