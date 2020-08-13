import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/address/address_bloc.dart';
import 'package:superloja/domain/address/address.dart';

class RowCityState extends StatelessWidget {
  final Address address;

  const RowCityState({Key key, this.address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) => Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    enabled: false,
                    initialValue: address.city.nome,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Cidade',
                      hintText: 'Rio de Janeiro',
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    enabled: false,
                    initialValue: address.state.sigla,
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Estado',
                      hintText: 'RJ',
                    ),
                  ),
                ),
              ],
            ));
  }
}
