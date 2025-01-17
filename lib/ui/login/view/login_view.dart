import 'package:flutter/material.dart';
import 'package:flutter_auth_cubits/ui/login/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import '../cubit/login_state.dart';

part '../widget/login_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),

      ///CONSUMER -> State'i Dinliyor + UI'ı Güncelliyor.
      body: BlocConsumer<LoginCubit, LoginState>(
        ///Builder -> State'e göre UI'ı Güncelliyor.
        builder: (context, state) {
          if (state is LoginLoading) {
            ///State = LOADING
            return const Center(child: CircularProgressIndicator());
          }
          return _LoginPageView();
        },

        ///Listener -> State'i Dinliyor
        listener: (context, state) {
          if (state is LoginSuccess) {
            _goToProfile(context, state.user.accessToken);
          } else if (state is LoginFailed) {
            _showSnackBar(context, 'Error: HATA HATA');
          }
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _goToProfile(BuildContext context, String accessToken) {
    context.goNamed(RoutesPath.profilePath.name, extra: accessToken);
  }
}
