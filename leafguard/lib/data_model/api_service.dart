import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:leafguard/data_model/prediction_response.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:developer' as dev;

Future<PredictionResponse?> fetchPrediction(Uint8List imageBytes) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('https://leafguard-model.onrender.com/predict'),
  );

  // Attach image as bytes
  request.files.add(http.MultipartFile.fromBytes(
    'file',
    imageBytes,
    filename: 'image.jpg',
    contentType: MediaType('image', 'jpg'),
  ));

  try {
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      dev.log("Response JSON: $jsonResponse");
      return PredictionResponse.fromJson(jsonResponse);
    } else {
      dev.log("Error: ${response.body}");
      return null;
    }
  } catch (e) {
    dev.log("Exception: $e");
    return null;
  }
}
