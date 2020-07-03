import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superloja/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:superloja/injection.dart';
import 'package:superloja/presentation/pages/auth/signup/signup_page.dart';
import 'package:superloja/presentation/pages/home/home_page.dart';
import 'package:superloja/presentation/pages/auth/signin/widgets/input_email_widget.dart';
import 'package:superloja/presentation/pages/auth/signin/widgets/input_password_widget.dart';
import 'package:superloja/presentation/pages/auth/signin/widgets/social_button_widget.dart';

import 'widgets/background.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) => getIt<SignInFormBloc>(),
      child: Scaffold(
        body: Background(
          child: BlocConsumer<SignInFormBloc, SignInFormState>(
            listenWhen: (old, current) =>
                old.authFailureOrSuccessOption !=
                current.authFailureOrSuccessOption,
            listener: (context, state) {
              state.authFailureOrSuccessOption.fold(
                () => {},
                (errorOrSucces) {
                  errorOrSucces.fold((failure) {
                    FlushbarHelper.createError(
                      message: failure.map(
                        cancelledByUser: (_) => "Cancelado...",
                        serverError: (_) => "Ops... Ocorreu um erro",
                        emailAlreadyInUse: (_) => "Email em uso",
                        invalidEmailAndPasswordCombination: (_) =>
                            "email ou senha inválidos",
                        userDisabled: (value) => "Usuario desabilitado",
                        userNotFound: (value) => "Usuário nao encontrado",
                      ),
                    ).show(context);
                  },
                      (_) => {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            )
                          });
                },
              );
            },
            builder: (context, state) => SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(32),
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/svg/login_banner.svg",
                          height: size.height * 0.15,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const InputEmailWidget(),
                        const SizedBox(
                          height: 16,
                        ),
                        const InputPasswordWidget(),
                        Align(
                          alignment: Alignment.topRight,
                          child: FlatButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            child: const Text(
                              'esqueci minha senha',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const LoginButton(),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FacebookButtonWidget(
                                onTap: () => {},
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: GoogleButtonWidget(
                                onTap: () => {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage())),
                          child: Text(
                            'Ou crie a sua conta',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: Colors.redAccent),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
