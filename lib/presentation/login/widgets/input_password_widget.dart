import 'package:flutter/material.dart';

class InputPasswordWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String errorMessage;

  const InputPasswordWidget({
    Key key,
    this.onChanged,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 80,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        onChanged: onChanged,
        maxLength: 10,
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            errorText: errorMessage,
            border: InputBorder.none,
            prefixIcon: Icon(Icons.lock),
            hintText: 'Senha'),
      ),
    );
  }
}
