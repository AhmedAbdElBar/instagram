import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/core/provider/theme_provider.dart';

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
        AppLocalizations.of(context)!.yourStoryUploadedSuccessfully,
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
    final themeProvier = ThemeProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.createStory),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                
                height: 400,
                width: double.infinity,
                color: themeProvier.themeMode == ThemeMode.dark
                    ? Colors.grey[800]
                    : Colors.grey[300],
                child: selectedFile != null
                    ? Image.file(
                        File(selectedFile!.path),
                        fit: BoxFit.cover,
                      )
                    : Center(child: Text(AppLocalizations.of(context)!.tapToSelectAnImage)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: captionController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.addACaption,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: uploadStory,
              child: Text(AppLocalizations.of(context)!.uploadStory),
            ),
          ),
        ],
      ),
    );
  }
}
