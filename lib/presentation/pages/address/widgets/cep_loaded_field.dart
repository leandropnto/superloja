import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/address/address_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class CepLoadedField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) => state.failureOrSuccess.fold(
        () => Container(),
        (a) => a.fold(
          (l) => Container(),
          (r) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "CEP: ${r.zipcode}",
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
