import 'package:flutter/material.dart';
import 'package:tafsirdictionary/components/text_field_container.dart';
import 'package:tafsirdictionary/constants.dart';

class RoundedNameField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController nameController;
  const RoundedNameField({
    Key? key,
    required this.hintText,
    required this.nameController,
    this.icon = Icons.article_outlined,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        controller: nameController,
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
