import 'package:flutter/material.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final ValueChanged<String> onChanged;
  final bool enabled;
  final bool autocorrect;
  final TextInputType keyboardType;
  final String errorText;
  final bool obscure;
  final Function(String) onSubmitted;
  final bool autoFocus;
  final TextInputAction textInputAction;
  final String initialvalue;
  final TextEditingController controller;
  final void Function(String) onSaved;
  final String Function(String) onValidate;

  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = const Icon(Icons.person),
      this.onChanged,
      this.enabled = true,
      this.autocorrect = false,
      this.keyboardType,
      this.errorText,
      this.obscure = false,
      this.onSubmitted,
      this.autoFocus = false,
      this.textInputAction = TextInputAction.done,
      this.initialvalue = "",
      this.controller,
      this.onSaved,
      this.onValidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        enabled: enabled,
        autocorrect: autocorrect,
        cursorColor: kPrimaryColor,
        keyboardType: keyboardType,
        obscureText: obscure,
        autofocus: autoFocus,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          border: InputBorder.none,
          errorText: errorText,
        ),
        onFieldSubmitted: onSubmitted,
        validator: onValidate,
      ),
    );
  }
}
