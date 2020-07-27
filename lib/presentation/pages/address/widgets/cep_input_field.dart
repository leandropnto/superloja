import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/address/address_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class CepInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
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
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            onChanged: (value) => context
                .bloc<AddressBloc>()
                .add(AddressEvent.onChangeCep(value)),
            validator: (value) => state.cep.value.fold(
                (l) => l.maybeMap(
                    invalidCep: (e) => "CEP inválido",
                    shortInput: (e) => "Informe o CEP completo",
                    orElse: () => "Informe o CEP"),
                (r) => null),
          ),
          RaisedButton(
            onPressed: () {
              if (Form.of(context).validate()){
                context.bloc<AddressBloc>().add(const AddressEvent.loading());
              }

            },
            color: kPrimaryColor,
            disabledColor: kPrimaryLightColor,
            textColor: Colors.white,
            child: const Text('Buscar CEP'),
          ),
        ],
      );
    });
  }
}
