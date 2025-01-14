import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/login_cubit.dart';
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
        listener: (context, state) {
          if (state is LoginSuccess) {
            ///State = SUCCESS
            _goToProfile(context);
          } else if (state is LoginFailed) {
            ///State = FAİLED
            _showSnackBar(context, 'Error:');
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            ///State = LOADING
            return const Center(child: CircularProgressIndicator());
          }
          return _buildLoginForm(context);
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return _LoginPageView();
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _goToProfile(BuildContext context) {
    context.go('/prof');
  }
}
