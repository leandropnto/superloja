import 'package:flutter/material.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({
    Key key,
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
      child: const TextField(
        maxLength: 10,
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.lock,
              //color: Colors.white,
            ),
            hintText: 'Senha'),
      ),
    );
  }
}
