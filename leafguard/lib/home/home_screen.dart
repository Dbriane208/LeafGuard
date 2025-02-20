import 'package:flutter/material.dart';
import 'package:leafguard/utils/Buttons.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF2E1),
      body: Padding(
        padding: EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20
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
            UploadCard(),
            SizedBox(height: 20),
            ScanCard(),
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

class ScanCard extends StatelessWidget {
  const ScanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white
        ),
        child: Column(
        spacing: 5,
        children:[
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF93B183),
                    width: 1
                 ),
                 borderRadius: BorderRadius.circular(15)
                ),
                child: const Icon(
                  Icons.star,
                  size: 20,
                  color: Color(0xFF93B183),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Know plant disease with LeafGuard AI",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    "Over 10000+ apple farmers trust us for better results.",
                    textAlign: TextAlign.left,
                  )
                ],
              )
              ),
            ],
          ),
          SizedBox(
            width: 400,
            height: 35,
            child:  OutlinedButton(
            onPressed: null,
            style: OutlinedButton.styleFrom(
              maximumSize: Size(400,50),
              side: BorderSide(
                color: Color(0xFF93B183),
                width: 1
              )
            ),
            child: const Text(
              "Scan Now",
              style: TextStyle(
                color: Color(0xFF93B183)
              ),
            ),
          ),
          ),
        ],
      ),
      ),
    );
  }
}

class DiseaseCard extends StatelessWidget {
  const DiseaseCard({
     required this.imagepath,
      required this.name,
      required this.description,
       super.key
  });

  final String imagepath;
  final String name;
  final String description;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPopupCard(context),
      child: Column(
      children: [
         ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
           child: Image.asset(
            imagepath,
            width: 100,
            height: 100,
            fit: BoxFit.cover
          ),
        ),
        SizedBox(height: 5),
        Text(name),  
      ]
    ),
    );
  }

  void _showPopupCard(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFEDF2E1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          contentPadding: EdgeInsets.all(10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagepath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close),
                    iconSize: 20,
                  )
              ]),
              SizedBox(height: 5),
              Flexible(
                child: Text(
                description,
                style: TextStyle(
                  color: Colors.black
                ),
              ))
            ],
          ),
        );
      }
    );
  } 
}

class UploadCard extends StatefulWidget {
  const UploadCard({super.key});
  
  @override
  State<UploadCard> createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border.all(
        color: Color(0xFF93B183),
        width: 1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.image,
              color: Color(0xFF93B183),
              size: 30,
            ),
            ElevatedButton(
              onPressed: (){},
              style: raisedButtonStyle,
              child: Text(
                "Upload Image",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
