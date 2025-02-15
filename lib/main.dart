import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/provider/language_provider.dart';
import 'package:instagram/core/theme/app_theme.dart';
import 'package:instagram/core/provider/theme_provider.dart';
import 'package:instagram/features/Explore_screen/presentation/view/exploreScreen.dart';
import 'package:instagram/features/auth/presentation/view/Register.dart';
import 'package:instagram/features/auth/presentation/view/log_in.dart';
import 'package:instagram/features/chat/presentation/view/caht_screen.dart';
import 'package:instagram/features/home/presentation/view/home_screen.dart';
import 'package:instagram/features/home/presentation/widgets/create_post.dart';
import 'package:instagram/features/home/presentation/widgets/create_story.dart';
import 'package:instagram/features/notifications/notifications.dart';
import 'package:instagram/features/profile_page/presentation/view/myProfilePage.dart';
import 'package:instagram/features/profile_page/presentation/view/profilePage.dart';
import 'package:instagram/features/settings/presentation/view/setteng_screen.dart';
import 'package:instagram/features/settings/presentation/widgets/edit_profile.dart';
import 'package:instagram/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const ThemeProvider(child: MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = ThemeProvider.of(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(languageProvider.localeLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      routes: {
        LogIn.routname: (context) => LogIn(),
        Notifications.routname: (context) => Notifications(),
        SettingScreen.routname: (context) => SettingScreen(),
        EditProfile.routname: (context) => EditProfile(),
        Register.routname: (context) => Register(),
        ChatScreen.routname: (context) => ChatScreen(),
        HomeScreen.routname: (context) => HomeScreen(),
        CreateStory.routname: (context) => CreateStory(),
        CreatePost.routname: (context) => CreatePost(),
        Profilepage.routname: (context) => Profilepage(),
        Myprofilepage.routname: (context) => Myprofilepage(),
        ExploreScreen.routeName: (context) => ExploreScreen(),
      },
      home: AuthCheck(),
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
                child: CircularProgressIndicator()), // Show loading screen
          );
        }
        if (snapshot.hasData) {
          return HomeScreen(); // If user is logged in, go to HomeScreen
        }
        return LogIn(); // Otherwise, go to LogIn screen
      },
    );
  }
}
