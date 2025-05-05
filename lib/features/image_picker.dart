import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  String? imgPath;
  void chooseImageInGallery() async {
    XFile? imageFile;
    imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      imgPath = imageFile.path;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chose Image"),
      ),
      body: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: SizedBox(
                width: double.maxFinite,
                height: 200,
                child: Center(
                  child: imgPath == null
                      ? Text("Rasm tanlang")
                      : Image.file(
                    File(
                      imgPath!,
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 80,
          ),
          ElevatedButton(
              onPressed: () {
                chooseImageInGallery();
              },
              child: Text("Chose Imgae"))
        ],
      ),
    );
  }
}
