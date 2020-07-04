import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/auth/sign_up_form/sign_up_form_bloc.dart';
import 'package:superloja/injection.dart';
import 'package:superloja/presentation/pages/auth/signup/widgets/background.dart';
import 'package:superloja/presentation/pages/auth/signup/widgets/create_button.dart';
import 'package:superloja/presentation/pages/auth/signup/widgets/inputs_widget.dart';
import 'package:superloja/presentation/pages/auth/signup/widgets/logo_widget.dart';
import 'package:superloja/presentation/pages/home/home_page.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpFormBloc>(
      create: (context) => getIt<SignUpFormBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Criar Conta'),
        ),
        body: Background(
          child: BlocConsumer<SignUpFormBloc, SignUpFormState>(
            listenWhen: (old, current) =>
                old.authFailureOrSuccessOption !=
                current.authFailureOrSuccessOption,
            listener: (context, state) {
              state.authFailureOrSuccessOption.fold(
                () => {},
                (failureOrSuccess) => failureOrSuccess.fold(
                  (f) => FlushbarHelper.createError(
                    message: f.map(
                      cancelledByUser: (_) => "Cancelado...",
                      serverError: (_) => "Ops... Ocorreu um erro",
                      emailAlreadyInUse: (_) => "Já existe uma conta com este email",
                      invalidEmailAndPasswordCombination: (_) =>
                          "email ou senha inválidos",
                      userDisabled: (value) => "Usuario desabilitado",
                      userNotFound: (value) => "Usuário nao encontrado",
                    ),
                  ).show(context),
                  (r) => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  ),
                ),
              );
            },
            builder: (context, state) {
              return ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  LogoWidget(),
                  NameInput(),
                  EmailInput(),
                  PasswordInput(),
                  ConfirmationInput(),
                  CreateButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
