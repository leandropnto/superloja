import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/drawer/drawer_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/core/constants.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;
  final VoidCallback onTap;


  const DrawerTile({
    Key key,
    this.iconData,
    this.title,
    this.page,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return BlocBuilder<DrawerBloc, DrawerState>(
      builder: (BuildContext context, DrawerState state) {
        return InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 60,
            child: Row(
              children: <Widget>[
                Icon(
                  iconData,
                  size: 32,
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  width: 24,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
