import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/address/address_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/address/widgets/calc_shipping_button.dart';
import 'package:superloja/presentation/pages/address/widgets/row_city_state.dart';

import 'row_number_complement.dart';

class AddressInputField extends StatelessWidget {
  const AddressInputField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
      if (state.isLoading) {
        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(kPrimaryColor),
        );
      } else {
        return state.failureOrSuccess.fold(
          () => Container(),
          (a) => a.fold(
            (l) => const Text('Erro carregando o CEP'),
            (r) => Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    initialValue: r.logradouro,
                    enabled: false,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Rua/Avenida',
                      hintText: 'Av. Brasil',
                    ),
                    //onSaved: (value) => r.logradouro = value,
                  ),
                  RowNumberComplement(),
                  TextFormField(
                    initialValue: r.bairro,
                    enabled: false,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Bairro',
                      hintText: 'Copacabana',
                    ),
                  ),
                  RowCityState(
                    address: r,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CalcShippingButton(),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
