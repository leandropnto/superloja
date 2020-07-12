import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:superloja/presentation/pages/home/widgets/cart_button.dart';
import 'package:superloja/presentation/pages/home/widgets/section_loading.dart';

import 'widgets/section_error.dart';
import 'widgets/section_products.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      drawer: CustomDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            elevation: 0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Super Loja'),
              centerTitle: true,
            ),
            actions: <Widget>[
              CartButton(),
            ],
          ),
          BlocBuilder<SectionBloc, SectionState>(
            builder: (context, state) {
              return state.map(
                initial: (e) =>  SectionLoading(),
                loadInProgress: (e) => SectionLoading(),
                loadSuccess: (e) => SectionProducts(sections: e.sections),
                loadFailure: (e) => SectionError(error: e.sectionFailure),
              );
            },
          ),
        ],
      ),
    );
  }
}
