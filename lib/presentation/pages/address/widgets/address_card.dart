import 'package:flutter/material.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/address/widgets/address_input_field.dart';
import 'package:superloja/presentation/pages/address/widgets/cep_input_field.dart';

import 'cep_loaded_field.dart';

class AddreessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Form(
          child: Column(
            children: <Widget>[
              const Text(
                'Endereço de Entrega',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: kPrimaryColor,
                ),
              ),
              CepInputField(),
              CepLoadedField(),
              const AddressInputField(),
            ],
          ),
        ),
      ),
    );
  }
}
