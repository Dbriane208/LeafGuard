import 'package:flutter/material.dart';
import 'package:leafguard/home/home_screen.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          Image.asset("assets/images/crop-leafguard.png", height: 300,),
          SizedBox(height: 20,),
          const Text(
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            "Welcome to LeafGuard. We're on a mission to empower your Plants health care journey. Snap, diagnose and grow." ),
          SizedBox(height: 100,),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 55, 165, 58),
            ),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const HomeScreen())
              );
            },
             child: const Text(
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold),
              "Get Started"
              )
            )
        ],
      ),
    );
  }

}