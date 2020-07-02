import 'package:flutter/material.dart';

class InputEmailWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String error;

  const InputEmailWidget({
    Key key,
    this.onChanged,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.bottomLeft,
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.white,
            border: InputBorder.none,
            prefixIcon: Icon(Icons.email),
            errorText: error,
            hintText: 'E-mail'),
      ),
    );
  }
}
