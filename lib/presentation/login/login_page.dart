import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superloja/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:superloja/injection.dart';
import 'package:superloja/presentation/login/widgets/input_email_widget.dart';
import 'package:superloja/presentation/login/widgets/input_password_widget.dart';
import 'package:superloja/presentation/login/widgets/social_button_widget.dart';

import 'widgets/background.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) => getIt<SignInFormBloc>(),
      child: Scaffold(
        body: Background(
          child: BlocConsumer<SignInFormBloc, SignInFormState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              return SafeArea(
                child: Column(
                  children: <Widget>[
                    // const SizedBox(
                    //   height: 80,
                    // ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            debugPrint("clicou");
                            Navigator.of(context).pop();
                          }),
                    ),
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
                          InputEmailWidget(
                            onChanged: (value) => context
                                .bloc<SignInFormBloc>()
                                .add(SignInFormEvent.emailChanged(value)),
                            error: state.showErrorMessages
                                ? state.emailAddress.mapToErrorMessage(
                                    "Informe um email válido!")
                                : null,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          InputPasswordWidget(
                            onChanged: (value) => context
                                .bloc<SignInFormBloc>()
                                .add(SignInFormEvent.passwordChanged(value)),
                            errorMessage: state.showErrorMessages
                                ? state.password.mapToErrorMessage(
                                    "Informe uma senha válida!")
                                : null,
                          ),
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
                          const SizedBox(
                            height: 8,
                          ),
                          LoginButton(
                            onTap: () => context.bloc<SignInFormBloc>().add(
                                const SignInFormEvent
                                    .signInWithEmailAndPasswordPressed()),
                          ),
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
                          Text(
                            'Ou crie a sua conta',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: Colors.redAccent),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
