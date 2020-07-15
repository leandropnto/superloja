import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/presentation/core/constants.dart';

class UsersList extends StatelessWidget {
  final List<User> users;

  const UsersList({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    users.sort((a, b) => a.name.value
        .fold((l) => "Invalido", (r) => r)
        .compareTo(b.name.value.fold((l) => "Invalido", (r) => r)));
    final names = users
        .map((e) => e.name)
        .map((e) => e.value.fold((l) => "Invalido", (r) => r))
        .toList();
    return AlphabetListScrollView(
      itemBuilder: (_, index) => ListTile(
        title: Text(
          users[index].name.value.fold((l) => "Invalido", (r) => r),
          style: TextStyle(color: kPrimaryColor),
        ),
        subtitle:
            Text(users[index].email.value.fold((l) => "Invalido", (r) => r)),
      ),
      strList: names,
      indexedHeight: (_) => 50,
      showPreview: true,
      highlightTextStyle: TextStyle(color: kPrimaryColor, fontSize: 20),
    );
  }
}
