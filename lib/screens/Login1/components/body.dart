import 'package:flutter/material.dart';
import 'package:tafsirdictionary/screens/Login1/components/background.dart';
import 'package:tafsirdictionary/screens/Signup/signup_screen.dart';
import 'package:tafsirdictionary/components/already_have_an_account_acheck.dart';
import 'package:tafsirdictionary/components/rounded_button.dart';
import 'package:tafsirdictionary/components/rounded_input_field.dart';
import 'package:tafsirdictionary/components/rounded_password_field.dart';

import '../../../providers/user.provider.dart';
import '../../../widgets/loading-indicator.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/login.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
              emailController: emailController,
            ),
            RoundedPasswordField(
              passwordController: passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                try {
                  LoadingIndicator.showLoadingDialog(context);
                  AppUser.instance.signIn(
                      email: emailController.text,
                      password: passwordController.text);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/landing', ModalRoute.withName('/'));
                  // Navigator.pop(context);
                  // Navigator.pop(context);
                } catch (e) {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(e.toString()),
                        );
                      });
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
