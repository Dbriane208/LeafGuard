import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leafguard/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';


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

class UploadCard extends StatelessWidget {
  const UploadCard({
    super.key,
    required this.imageBytes,
    required this.clearImage,
    required this.requestGalleryPermission
  });  

  final Uint8List? imageBytes;
  final VoidCallback clearImage;
  final VoidCallback requestGalleryPermission;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 500,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border.all(
        color: Color(0xFF93B183),
        width: 1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageBytes == null
            ? Icon(Icons.image,color: Color(0xFF93B183),size: 30)
            : Container(
              padding: EdgeInsets.all(10),
              height: 150,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.memory(
                      imageBytes!,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black,
                      ),
                      onPressed: clearImage
                    )
                  )
              ]),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: requestGalleryPermission,
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
    );
  }
}

class ScanCard extends StatelessWidget {
  const ScanCard({
    super.key,
    required this.imageBytes,
    required this.showModalBottomSheet
  });

  final Uint8List? imageBytes;
  final VoidCallback showModalBottomSheet;

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
                ])
              )],
          ),
          SizedBox(
            width: 400,
            height: 35,
            child:  OutlinedButton(
            onPressed: () {
              if(imageBytes == null){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text("Please Upload an image first"))
                );
              } else {
                showModalBottomSheet();
              }
            },
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

class UploadAndScanCard extends StatefulWidget {
  const UploadAndScanCard({super.key});
  
  @override
  State<UploadAndScanCard> createState() => _UploadAndScanCard();
}

class _UploadAndScanCard extends State<UploadAndScanCard> {
  File? _image;
  Uint8List? _imageBytes;


  // Function to request permission and pick an image
  Future<void> _requestGalleryPermission() async {
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      _pickImage();
    } else if (status.isDenied) {
      _showPermissionDialog();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Load image as bytes
      Uint8List bytes = await imageFile.readAsBytes();

      setState(() {
        _image = imageFile;
        _imageBytes = bytes;
      });
    }
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),
       builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEDF2E1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
          ),
          child: Column(
            children: [
              Text(
                "Predicted Disease: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Prediction Accuracy: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              )
            ],
          ),
        );
       }
    );
  }

  // Function to clear the selected image
  void _clearImage() {
    setState(() {
      _imageBytes = null;
    });
  }

  // Function to show permission dialog
  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Gallery Permission"),
          content: Text("Allow LeafGuard to Access your Storage"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel")
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _requestGalleryPermission();
              },
              child: const Text("Allow")
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UploadCard(imageBytes: _imageBytes, clearImage: _clearImage, requestGalleryPermission: _requestGalleryPermission),
        SizedBox(height: 20),
        ScanCard(imageBytes: _imageBytes, showModalBottomSheet: _showModalBottomSheet)
      ],
    );
  }
}