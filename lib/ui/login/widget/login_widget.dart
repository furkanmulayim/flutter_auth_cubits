part of '../view/login_view.dart';

class _LoginPageView extends StatelessWidget {
  final TextEditingController usernameController =
      TextEditingController(text: 'emilys');
  final TextEditingController passwordController =
      TextEditingController(text: 'emilyspass');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final username = usernameController.text;
              final password = passwordController.text;
              context.read<LoginCubit>().login(username, password);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
