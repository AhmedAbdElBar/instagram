import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/provider/theme_provider.dart';
import 'package:instagram/features/home/data/userdata.dart';
import 'package:instagram/features/settings/data/update_user_data.dart';
import 'package:instagram/features/settings/presentation/widgets/profile_fields.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfile extends StatefulWidget {
  static const String routname = "editProfile";

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final user = Userdata();
  final auth = FirebaseAuth.instance;
  final updateData = UpdateUserData();
  XFile? selectedFile;
  late TextEditingController usernameController;
  late TextEditingController bioController;
  late TextEditingController emailController;
  late TextEditingController phoneNumber;
  late TextEditingController gender;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    bioController = TextEditingController();
    emailController = TextEditingController();
    fetchData();
  }

  @override
  void dispose() {
    usernameController.dispose();
    bioController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void fetchData() async {
    await user.fetchUser();
    setState(() {
      usernameController.text = user.username ?? '';
      bioController.text = user.bio ?? '';
      emailController.text = auth.currentUser!.email ?? '';
    });
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedFile = image;
    });
  }

  void saveChanges() async {
    await updateData.updateUserProfile(
        username: usernameController.text,
        bio: bioController.text,
        profileImage: user.profileImage ?? "",
        email: emailController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.profileUpdatedSuccessfully),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Cancel button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: themeProvider.themeMode == ThemeMode.dark
                        ? Colors.grey
                        : Colors.black),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.editProfile,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            // Save changes
            TextButton(
              onPressed: () {
                saveChanges();
              },
              child: Text(
                AppLocalizations.of(context)!.done,
                style: TextStyle(
                    color: ThemingColor.blueFontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            //Profile photo
            CircleAvatar(
              backgroundImage: user.profileImage != null
                  ? AssetImage(user.profileImage!)
                  : const AssetImage("assets/posts/post (16).png"),
              radius: 70,
            ),
            // Change profile photo button
            TextButton(
              onPressed: () => pickImage(),
              child: Text(
                AppLocalizations.of(context)!.changeProfilePhoto,
                style: TextStyle(
                    color: ThemingColor.blueFontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //username field
                ProfileField(label: "Username", controller: usernameController),
                Divider(),
                //email field
                ProfileField(label: "Email", controller: emailController),
                Divider(),
                //bio field
                ProfileField(
                    label: "Bio", controller: bioController, maxLines: 2),
                Divider(),
                Container(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Switch to Professonal Account",
                      style: TextStyle(color: ThemingColor.blueFontColor),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  child: Text(
                    "Private Information",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Divider(),
                //phone field
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: Text(
                        "Phone",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 0.5,
                      color: ThemingColor.lightGrayColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "+ 123 456 789",
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: Text(
                        "Gender",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 0.5,
                      color: ThemingColor.lightGrayColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Male",
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
