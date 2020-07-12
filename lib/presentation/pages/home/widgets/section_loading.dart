import 'package:flutter/material.dart';
import 'package:superloja/presentation/core/constants.dart';

class SectionLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(kPrimaryColor),),
      )),
    );
  }
}
