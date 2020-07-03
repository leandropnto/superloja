import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: RaisedButton.icon(
          disabledColor: const Color(0xFF3b5998).withAlpha(100),
          color: const Color(0xFF3b5998),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {},
          textColor: Colors.white,
          icon: Icon(FontAwesome.save),
          label: Text(
            'CADASTRAR',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          )),
    );
  }
}
