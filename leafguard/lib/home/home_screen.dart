import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
        top: 40,
        left: 10,
        right: 10
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text(
            "Home",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold
            )
            ),
            SizedBox(height: 20),
            ImageCard(),
            SizedBox(height: 20),
            const Text(
            "Supported Diseases",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold
            )
            ),
            
           ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        ),
    );
  }}


class ImageCard extends StatelessWidget {
  const ImageCard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child:  Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
          Image.asset(
            "assets/images/black-apple-farmer.jpeg",
            width: 500,
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(
            width: 500,
            height: 100,
            padding: const EdgeInsets.all(10),
            color: const Color.fromRGBO(129, 212, 250, 0.4),
            child: const Text (
              "LeafGuard is empowering Apple farmers with instant plant disease detection and helps them safeguard farms with proactive, on-the-spot crop care and disease prevention insights",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            )
          )
        ],
      ) 
      ),
    );
  }
}