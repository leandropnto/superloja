import 'package:flutter/material.dart';

class RowNumberComplement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              isDense: true,
              labelText: 'Número',
              hintText: '200',
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              isDense: true,
              labelText: 'Complemento',
              hintText: 'apto 201',
            ),
          ),
        ),
      ],
    );
  }
}
