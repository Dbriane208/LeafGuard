import 'package:flutter/material.dart';
import 'package:leafguard/home/components.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF2E1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
        bottom: 20
        ),
        child:Column(
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DiseaseCard(
                  imagepath: "assets/images/apple-scab.jpeg",
                  name: "Apple Scab",
                  description: "Apple scab is a fungal disease caused by Venturia inaequalis, thriving in cool, wet conditions and spreading through infected leaves and fruit. It presents as olive-green to black velvety spots on leaves and fruit, leading to defoliation and reduced fruit quality.",
                ),
                DiseaseCard(
                  imagepath: "assets/images/apple-black-rot.jpeg",
                  name: "Apple Black Rot",
                  description: "Apple black rot, caused by Botryosphaeria obtusa, spreads through wind and rain, affecting fruit, leaves, and bark. Symptoms include dark brown, circular fruit lesions with a bulls-eye pattern, purple-bordered leaf spots, and sunken bark cankers that cause branch die back.",
                ),
                DiseaseCard(
                  imagepath: "assets/images/apple-cedar-rust.jpeg",
                  name: "Apple Cedar Rust",
                  description: "Cedar apple rust, caused by Gymnosporangium juniperi-virginianae, requires both apple trees and junipers to complete its life cycle. It manifests as bright orange or yellow leaf spots, hard brownish fruit lesions, and gelatinous galls on junipers that release spores in wet weather.",
                ),
              ],
            ),
            SizedBox(height: 20),
            const Text(
              "Upload the Image",
              style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold
            )
            ),
            SizedBox(height: 20),
            UploadAndScanCard()
           ]) ,
        )));
  }
}