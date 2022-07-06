import 'package:flutter/material.dart';
import 'package:tafsirdictionary/Screens/Login1/login_screen.dart';
import 'package:tafsirdictionary/Screens/Signup/components/background.dart';
import 'package:tafsirdictionary/components/already_have_an_account_acheck.dart';
import 'package:tafsirdictionary/components/rounded_button.dart';
import 'package:tafsirdictionary/components/rounded_input_field.dart';
import 'package:tafsirdictionary/components/rounded_password_field.dart';
import '../../../components/round_name_field.dart';
import '../../../providers/user.provider.dart';
import '../../../services/firestore_service.dart';
import '../../../widgets/loading-indicator.dart';

AppUser appUser = AppUser();
FireStoreService fireStoreService = FireStoreService();

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController namaController = TextEditingController();
String role = "pengguna";

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/login.png",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
              emailController: emailController,
            ),
            RoundedNameField(
              hintText: "Username",
              onChanged: (value) {},
              nameController: namaController,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              passwordController: passwordController,
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                try {
                  LoadingIndicator.showLoadingDialog(context);
                  await AppUser.instance.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  fireStoreService.createUserData(
                    emailController.text,
                    namaController.text,
                    appUser.user!.uid,
                    passwordController.text,
                    role,
                  );

                  Navigator.pop(context);
                  Navigator.pop(context);
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
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
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
