import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_page/FarmerLogin_Screens/ProfileDetail.dart';
import 'package:language_page/FarmerLogin_Screens/demo.dart';
import 'package:language_page/Login_Signup_Screen/Asach.dart';
import 'package:language_page/Start_Screens/Sessiondata.dart';

import 'package:language_page/Start_Screens/language_page.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});
  @override
  State<LogoPage> createState() => _LogoPage();
}

String? CustomerMail;

class _LogoPage extends State<LogoPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () async {
      bool status = false;

      await Sessiondata.getSessionData();
      print("IS LOGIN : ${Sessiondata.islogin}");

      // if (Sessiondata.islogin == true) {

      //   print("Navigate To Home");
      //   // ignore: use_build_context_synchronously
      //   Navigator.pushReplacement(context,
      //       MaterialPageRoute(builder: (context) => const HomePageFarmer()));
      //   print("After Navigator");
      // } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LangPage()),
      );
      //}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.green, Color.fromARGB(255, 232, 236, 233)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 260,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.solid,
                      blurRadius: 30.0,
                    )
                  ]),
              child: ClipOval(
                child: Image.asset(
                  "assets/farmfresh_logo.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Text(
              "Fresh from the soil",
              style: GoogleFonts.merienda(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 53, 112, 55),
              ),
            ),
            Text(
              "to your home",
              style: GoogleFonts.merienda(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 53, 112, 55),
              ),
            ),
            const SizedBox(
                // height: 200,
                ),
          ],
        ),
      ),
    );
  }
}
