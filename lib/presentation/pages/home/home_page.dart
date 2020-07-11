import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:superloja/presentation/pages/home/widgets/cart_button.dart';

import 'widgets/section_error.dart';
import 'widgets/section_products.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Loja'),
        actions: <Widget>[
          CartButton(),
        ],
      ),
      drawer: CustomDrawer(),
      body: BlocBuilder<SectionBloc, SectionState>(builder: (context, state) {
        return state.map(
          initial: (e) => const CircularProgressIndicator(),
          loadInProgress: (e) => const CircularProgressIndicator(),
          loadSuccess: (e) => SectionProducts(sections: e.sections),
          loadFailure: (e) => SectionError(error: e.sectionFailure),
        );
      }),
    );
  }
}
