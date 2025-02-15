import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/provider/theme_provider.dart';
import 'package:instagram/features/auth/data/register_data.dart';
import 'package:instagram/core/customized_button_widget.dart';
import 'package:instagram/features/auth/presentation/widget/customized_textField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatelessWidget {
  static const String routname = "Register";
  RegisterData data = RegisterData();
  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 244,
              height: 68,
              child: Image(
                image: themeProvider.themeMode == ThemeMode.dark
                    ? AssetImage("assets/images/image2.png")
                    : AssetImage("assets/images/image1.png"),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Email Field
            Textfield(
              text: AppLocalizations.of(context)!.email,
              controller: data.emailController,
              isPassword: false,
            ),
            const SizedBox(
              height: 20,
            ),
            // Username Field
            Textfield(
              text: AppLocalizations.of(context)!.username,
              controller: data.usernameController,
              isPassword: false,
            ),
            const SizedBox(
              height: 20,
            ),
            // Password Field
            Textfield(
              text: AppLocalizations.of(context)!.password,
              controller: data.passwordController,
              isPassword: true,
            ),
            const SizedBox(
              height: 20,
            ),
            // Confirm Password
            Textfield(
              text: AppLocalizations.of(context)!.confirmPassword,
              controller: data.confirmPasswordController,
              isPassword: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Buttonwidget(
              text: AppLocalizations.of(context)!.signup,
              chick: () => data.signUp(context),
              buttonColor: ThemingColor.blueButtonColor,
              isEditeButton: false,
            ),
          ],
        ),
      ),
    ));
  }
}
