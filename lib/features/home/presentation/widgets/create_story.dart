import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/core/colors_thems.dart';

class CreateStory extends StatefulWidget {
  static const String routname = "create story";
  const CreateStory({super.key});

  @override
  State<CreateStory> createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  final firestore = FirebaseFirestore.instance;
  XFile? selectedFile;
  final TextEditingController captionController = TextEditingController();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedFile = image;
    });
  }

  uploadStory() async {
    if (selectedFile == null) return;
    String username = "username";
    String storyImage = selectedFile!.path;
    String description = captionController.text;

    await firestore.collection("storys").add({
      'username': username,
      'storyImage': storyImage,
      'description': description
    });
    setState(() {
      selectedFile = null;
      captionController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Your story uploaded successfully!",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    ));
    Future.delayed(Duration(seconds: 0), () {
      Navigator.pop(context); // Navigate back to the home screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemingColor.maincolor,
      appBar: AppBar(
        title: Text('Create Story'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: uploadStory,
          ),
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: pickImage,
            child: Container(
              height: 400,
              width: double.infinity,
              color: Colors.grey[300],
              child: selectedFile != null
                  ? Image.file(
                      File(selectedFile!.path),
                      fit: BoxFit.cover,
                    )
                  : Center(child: Text("Tap to select an image")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: captionController,
              decoration: InputDecoration(
                hintText: 'Add a caption...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: uploadStory,
              child: Text('Upload Story'),
            ),
          ),
        ],
      ),
    );
  }
}
