import 'package:flutter/material.dart';
import 'package:tafsirdictionary/components/text_field_container.dart';
import 'package:tafsirdictionary/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController passwordController;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        controller: passwordController,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
