import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? imageFile;
  File? imageCameraFile;
  List<File>? imageFiles;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) {
        return;
      }

      final imageTemp = File(image.path);
      setState(() {
        imageFile = imageTemp;
      });
    } on PlatformException catch (exception) {
      throw Exception(exception);
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) {
        return;
      }

      final imageTemp = File(image.path);
      setState(() {
        imageCameraFile = imageTemp;
      });
    } on PlatformException catch (exception) {
      throw Exception(exception);
    }
  }

  Future pickMultipleImages() async {
    try {
      final List<XFile> images = await ImagePicker().pickMultiImage();

      if (images.isEmpty) {
        return;
      }

      //  map the XFiles to File by getting the path
      final List<File> imagesFiltered =
          images.map((imageFile) => File(imageFile.path)).toList();
      setState(() {
        imageFiles = imagesFiltered;
      });
    } on PlatformException catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => pickImage(),
                child: const Text('pick from gallery')),
            ElevatedButton(
                onPressed: () => pickMultipleImages(),
                child: const Text('pick multiple from gallery')),
            ElevatedButton(
                onPressed: () => pickImageFromCamera(), child: const Text('pick from camera')),
            SizedBox(
              height: 24,
            ),
            imageFile != null
                ? Image.file(imageFile!)
                : Text('No image selected'),
            imageCameraFile != null
                ? Image.file(imageCameraFile!)
                : Text('No camera image selected'),
            SizedBox(
              width: 200,
              height: 300,
              child: ListView.builder(
                  itemCount: imageFiles == null ? 0 : imageFiles!.length,
                  itemBuilder: (context, index) {
                    return imageFiles == null
                        ? Text("images not found")
                        : Image.file(imageFiles![index]);
                  }),
            )
          ],
        ),
      )),
    );
  }
}
