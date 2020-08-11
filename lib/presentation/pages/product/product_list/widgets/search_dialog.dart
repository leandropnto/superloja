import 'package:flutter/material.dart';
import 'package:superloja/presentation/core/widgets/rounded_input_field.dart';

class SearchDialog extends StatelessWidget {
  final String search;

  const SearchDialog({Key key, this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 4,
          right: 4,
          child: Card(
            child: RoundedInputField(
              autoFocus: true,
              initialvalue: search,
              textInputAction: TextInputAction.search,
              icon: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              onSubmitted: (value) {
                Navigator.of(context).pop(value);
              },
            ),
          ),
        )
      ],
    );
  }
}
