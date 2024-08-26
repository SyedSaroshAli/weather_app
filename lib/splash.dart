import 'package:flutter/material.dart';

//import 'package:google_fonts/google_fonts.dart';

import 'screen1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 0, 0, 0),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
   
            
                Image.asset('sun_cloud.png',
                height: 300,
                width: 300,),
                const Text(
                  "Weather Edge",
                  style: TextStyle(
                    color: Color.fromARGB(255, 97, 98, 99),
                    fontSize: 44,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            //     SizedBox(
            //       width: 2,
            //     ),
            //     Image.asset(
            //       'assets/globe_icon.png',
            //       width: 36,
            //       height: 36,
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            // Text("Find Your Dream",
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w400,
            //         color: Color(0xFFFFFFFF))),
            // Text("Destination With Us",
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.w400,
            //       color: Color(0xFFFFFFFF),
            //     )
            
          ],
        ),
      ),
    );
  }

  void toTheLoginPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Screen1()));
  }

  //initState Function
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 6), toTheLoginPage);
    super.initState();
  }
}
