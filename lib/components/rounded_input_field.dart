import 'package:flutter/material.dart';
import 'package:tafsirdictionary/components/text_field_container.dart';
import 'package:tafsirdictionary/constants.dart';

// final TextEditingController email = TextEditingController();

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController emailController;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.emailController,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
