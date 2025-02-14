import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/provider/theme_provider.dart';
import 'package:instagram/features/auth/data/login_data.dart';
import 'package:instagram/features/auth/presentation/view/Register.dart';
import 'package:instagram/core/customized_button_widget.dart';
import 'package:instagram/features/auth/presentation/widget/customized_textField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogIn extends StatefulWidget {
  static const String routname = 'LogIn';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  LoginData data = LoginData();

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
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
              SizedBox(
                height: 20,
              ),
              Textfield(
                text: AppLocalizations.of(context)!.email,
                controller: data.emailController,
                isPassword: false,
              ),
              SizedBox(
                height: 20,
              ),
              Textfield(
                text: AppLocalizations.of(context)!.password,
                controller: data.passwordController,
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              Buttonwidget(
                text: AppLocalizations.of(context)!.login,
                chick: () => data.login(context),
                buttonColor: ThemingColor.blueButtonColor,
                isEditeButton: false,
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dontHaveAccount,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Register.routname);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.register,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: ThemingColor.blueFontColor),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
