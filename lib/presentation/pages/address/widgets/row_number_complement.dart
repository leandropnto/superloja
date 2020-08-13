import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/address/address_bloc.dart';

class RowNumberComplement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
      return Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              autovalidate: true,
              decoration: const InputDecoration(
                isDense: true,
                labelText: 'Número',
                hintText: '200',
              ),
              onChanged: (value) => context
                  .bloc<AddressBloc>()
                  .add(AddressEvent.onChangeNumber(value)),
              validator: (value) =>
                  state.number.isNotValid() ? "Informe o número válido" : null,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: TextFormField(
              autovalidate: true,
              decoration: const InputDecoration(
                isDense: true,
                labelText: 'Complemento',
                hintText: 'apto 201',
              ),
              onChanged: (value) => context
                  .bloc<AddressBloc>()
                  .add(AddressEvent.onChangeComplement(value)),
              validator: (value) => state.complement.isNotValid()
                  ? "Informe o complemento válido"
                  : null,
            ),
          ),
        ],
      );
    });
  }
}
