import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/domain/section/section_failure.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/custom_drawer.dart';
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
              title: const Text(
                'Super Loja',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
              ),
              centerTitle: true,
              background: Container(
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/designer.png",
                        fit: BoxFit.fitHeight,
                        height: 130,
                      ),
                      Image.asset(
                        "assets/images/home_2.png",
                        fit: BoxFit.fitHeight,
                        height: 130,
                      ),
                    ],
                  )),
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
