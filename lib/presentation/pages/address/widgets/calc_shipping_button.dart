import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/address/address_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class CalcShippingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
      return RaisedButton(
        onPressed: state.failureOrSuccess
                .fold(() => false, (a) => a.fold((l) => false, (r) => true))
            ? () {
                if (Form.of(context).validate()) {
                  //context.bloc<AddressBloc>().add(const AddressEvent.loading());
                  print("ta valido!");
                }
              }
            : null,
        elevation: 0,
        color: kPrimaryColor,
        child: const Text(
          'Calcular FRETE',
          style: TextStyle(color: Colors.white),
        ),
      );
    });
  }
}
