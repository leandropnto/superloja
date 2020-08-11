import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/address/address_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class CepLoadedField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) => state.cep.fold(
        () => Container(),
        (a) => a.failureOrUnit.fold(
          (l) => Container(),
          (r) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "CEP: ${state.strCep}",
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                color: kPrimaryColor,
                onPressed: () =>
                    context.bloc<AddressBloc>().add(const AddressEvent.clear()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
