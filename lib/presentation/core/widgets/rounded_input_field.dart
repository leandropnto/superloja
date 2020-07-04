import 'package:flutter/material.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool enabled;
  final bool autocorrect;
  final TextInputType keyboardType;
  final String errorText;
  final bool obscure;

  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.enabled = true,
      this.autocorrect = false,
      this.keyboardType,
      this.errorText, this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        enabled: enabled,
        autocorrect: autocorrect,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        keyboardType: keyboardType,
        obscureText: obscure,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          errorText: errorText,
        ),
      ),
    );
  }
}
