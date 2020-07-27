import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/domain/section/section_failure.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:superloja/presentation/pages/home/widgets/cart_button.dart';
import 'package:superloja/presentation/pages/home/widgets/section_loading.dart';

import 'widgets/home_edit_button.dart';
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
            pinned: true,
            elevation: 0,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'IHMaginaS❤️',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                textAlign: TextAlign.left,
              ),
              centerTitle: true,
              background: Image.asset(
                "assets/images/logo.jpg",
                fit: BoxFit.cover,

              ),
            ),
            actions: <Widget>[
              CartButton(),
              HomeEditButton(),
            ],
          ),
          BlocBuilder<SectionBloc, SectionState>(
            builder: (context, state) {
              if (state.isLoading) {
                return SectionLoading();
              } else if (state.sectionFailure.isSome()) {
                return SectionError(
                    error: state.sectionFailure
                        .getOrElse(() => const SectionFailure.serverError()));
              } else {
                return SectionProducts(
                  key: state.isEditting
                      ? ObjectKey(state.edittingSections)
                      : ObjectKey(state.sections),
                  sections: state.isEditting
                      ? state.edittingSections
                      : state.sections,
                  isEditting: state.isEditting,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
