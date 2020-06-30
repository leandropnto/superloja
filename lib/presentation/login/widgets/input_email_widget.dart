import 'package:flutter/material.dart';

class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({
    Key key,
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
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.white,
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.email,
              //color: Colors.white,
            ),
            errorText: "Informe o e-mail",
            hintText: 'E-mail'),
      ),
    );
  }
}
