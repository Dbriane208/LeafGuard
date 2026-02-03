import 'package:flutter/material.dart';
import 'package:leafguard/data_model/user_model.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Color(0xFF93B183),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

Future<String?> checkUserInput(UserModel user) async {
  if (user.name.isEmpty ||
      user.email.isEmpty ||
      user.phoneNo.isEmpty ||
      user.password.isEmpty ||
      user.confirmPassword.isEmpty) {
    return "All fields are required.";
  }

  if (user.password.length < 6) {
    return "Password must be atleast 6 characters long.";
  }

  if (user.password != user.confirmPassword) {
    return "Passwords do not match.";
  }

  if (user.phoneNo.length < 10 && user.phoneNo.length > 10) {
    return "Phone Number must be 10 characters";
  }

  // No errors, user input is valid
  return null;
}
