import 'package:flutter/material.dart';
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
