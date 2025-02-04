import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/theme/app_theme.dart';
import 'package:instagram/core/theme/theme_provider.dart';
import 'package:instagram/features/Explore_screen/presentation/view/exploreScreen.dart';
import 'package:instagram/features/auth/presentation/view/Register.dart';
import 'package:instagram/features/auth/presentation/view/log_in.dart';
import 'package:instagram/features/chat/presentation/view/caht_screen.dart';
import 'package:instagram/features/home/presentation/view/home_screen.dart';
import 'package:instagram/features/home/presentation/widgets/create_story.dart';
import 'package:instagram/features/profile_page/presentation/view/myProfilePage.dart';
import 'package:instagram/features/profile_page/presentation/view/profilePage.dart';
import 'package:instagram/features/settings/presentation/view/setteng_screen.dart';
import 'package:instagram/features/settings/presentation/widgets/edit_profile.dart';
import 'package:instagram/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ThemeProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      routes: {
        LogIn.routname: (context) => LogIn(),
        SettingScreen.routname: (context) => SettingScreen(),
        EditProfile.routname: (context) => EditProfile(),
        Register.routname: (context) => Register(),
        ChatScreen.routname: (context) => ChatScreen(),
        HomeScreen.routname: (context) => HomeScreen(),
        CreateStory.routname: (context) => CreateStory(),
        Profilepage.routname: (context) => Profilepage(),
        Myprofilepage.routname: (context) => Myprofilepage(),
        ExploreScreen.routeName: (context) => ExploreScreen(),
      },
      initialRoute: LogIn.routname,
    );
  }
}
