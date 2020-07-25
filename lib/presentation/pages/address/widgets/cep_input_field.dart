import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/address/address_bloc.dart';
import 'package:superloja/domain/cep/value_objects.dart';
import 'package:superloja/presentation/core/constants.dart';

class CepInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                labelText: 'CEP',
                hintText: '12.345-678',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            ),
            RaisedButton(
              onPressed: () => context.bloc<AddressBloc>().add(AddressEvent.loading(Cep("20771450"))),
              color: kPrimaryColor,
              disabledColor: kPrimaryLightColor,
              textColor: Colors.white,
              child: const Text('Buscar CEP'),
            ),
          ],
        );
      }
    );
  }
}
