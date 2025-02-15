import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:instagram/core/provider/theme_provider.dart';
import 'package:instagram/features/home/data/userdata.dart';

class CreatePost extends StatefulWidget {
  static const String routname = "create post";
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final firestore = FirebaseFirestore.instance;
  XFile? selectedFile;
  final TextEditingController captionController = TextEditingController();
  final user = Userdata();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedFile = image;
    });
  }

  uploadPost() async {
    if (selectedFile == null) return;
    String? username = user.username;
    String postImage = selectedFile!.path;
    String? profileImage = user.profileImage;

    await firestore.collection("posts").add({
      'username': username,
      'postImage': postImage,
      'profileImage': profileImage,
    });
    setState(() {
      selectedFile = null;
      captionController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        AppLocalizations.of(context)!.yourPostUploadedSuccessfully,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    ));
    Future.delayed(Duration(seconds: 0), () {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    user.fetchUser().then((_) {
      setState(() {});
    });
  }

  Future<void> refreshData() async {
    await user.fetchUser(); // Re-fetch user data
    setState(() {}); // Update UI
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.createPost),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: uploadPost,
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
                color: themeProvider.themeMode == ThemeMode.dark
                    ? Colors.grey[800]
                    : Colors.grey[300],
                child: selectedFile != null
                    ? Image.file(
                        File(selectedFile!.path),
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Text(
                            AppLocalizations.of(context)!.tapToSelectAnImage)),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: uploadPost,
              child: Text(AppLocalizations.of(context)!.uploadPost),
            ),
          ),
        ],
      ),
    );
  }
}
