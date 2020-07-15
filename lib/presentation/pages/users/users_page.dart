import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/users/users_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

import 'widgets/user_widget.dart';
import 'widgets/users_list.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        centerTitle: true,
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) => state.map(
          initial: (e) => Container(),
          loading: (e) => Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(kPrimaryColor),
            ),
          ),
          error: (e) => Center(
            child: Text(
              "Ops... ocorreu um erro. Por favor, tente novamente",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          loaded: (e) => UsersList(users: e.users),
          loadedUser: (e) => UserWidget(user: e.user),
        ),
      ),
    );
  }
}
