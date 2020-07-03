import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/drawer/drawer_bloc.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;
  final Widget Function() navigate;
  final Widget Function() navigateReplace;

  const DrawerTile({
    Key key,
    this.iconData,
    this.title,
    this.page,
    this.navigate,
    this.navigateReplace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return BlocBuilder<DrawerBloc, DrawerState>(
      builder: (BuildContext context, DrawerState state) {
        return InkWell(
          onTap: () {
            if (navigate != null) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => navigate()));
            } else if (navigateReplace != null) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => navigateReplace()));
            }
          },
          child: SizedBox(
            height: 60,
            child: Row(
              children: <Widget>[
                Icon(
                  iconData,
                  size: 32,
                  color: state.page == page ? primaryColor : Colors.grey[700],
                ),
                const SizedBox(
                  width: 24,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: state.page == page ? primaryColor : Colors.grey[700],
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
