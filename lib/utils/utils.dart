import 'dart:io';
import 'package:universal_html/html.dart' as html1;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

Future removerecaptcha() async {
  // Add your function code here!
  var captcha = html1.querySelector('#__ff-recaptcha-container');
  if (captcha != null) {
    captcha.hidden = true;
  }
  return;
}

Future<File?> pickImage(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context, e.toString());
  }
  return image;
}
