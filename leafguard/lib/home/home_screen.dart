import 'package:flutter/material.dart';
import 'package:leafguard/home/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF2E1),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Home",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              )),
          SizedBox(height: 20),
          ImageCard(),
          SizedBox(height: 20),
          const Text("Supported Diseases",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              )),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DiseaseCard(
                imagepath: "assets/images/potato-early-blight.jpg",
                name: "Potato Early Blight",
                description:
                    "Potato early blight is a fungal disease caused by Alternaria solani, thriving in warm, humid conditions. It presents as dark, sunken lesions on older leaves, leading to premature leaf drop and reduced tuber quality.",
              ),
              DiseaseCard(
                imagepath: "assets/images/potato-late-blight.jpg",
                name: "Potato Late Blight",
                description:
                    "Potato late blight, caused by Phytophthora infestans, is a serious disease affecting potatoes and tomatoes. It thrives in cool, moist conditions and can spread rapidly, leading to significant crop losses. Symptoms include dark, water-soaked lesions on leaves and stems, which can quickly turn into a fluffy white mold.",
              ),
              DiseaseCard(
                imagepath: "assets/images/potato-healthy.jpg",
                name: "Potato Healthy",
                description:
                    "Potato healthy refers to plants that are free from diseases and pests, exhibiting normal growth and development. Healthy potato plants have vibrant green leaves, sturdy stems, and produce high-quality tubers.",
              ),
            ],
          ),
          SizedBox(height: 20),
          const Text("Upload the Image",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              )),
          SizedBox(height: 20),
          UploadAndScanCard()
        ]),
      )),
    );
  }
}
