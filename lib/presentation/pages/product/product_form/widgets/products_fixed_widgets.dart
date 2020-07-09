import 'package:flutter/material.dart';

class ProductTextAPartirDe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        'A partir de',
        style: TextStyle(color: Colors.grey[600], fontSize: 13),
      ),
    );
  }
}
