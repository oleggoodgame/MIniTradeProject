import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/data/style/style.dart';
import 'package:mini_cash/domain/log_in/data/repository/request/log_in_request.dart';
import 'package:mini_cash/domain/log_in/presentation/controller/log_in_controller.dart';
import 'package:mini_cash/domain/log_in/presentation/state/log_in_state.dart';
import 'package:mini_cash/presentation/providers/account_provider.dart';

class LogInPresentation extends ConsumerStatefulWidget {
  const LogInPresentation({super.key});

  @override
  ConsumerState<LogInPresentation> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInPresentation> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(logInControllerProvider);
    final isLoading = state.isLoading;

    ref.listen<String?>(logInControllerProvider.select((s) => s.error), (
      previous,
      next,
    ) {
      if (next != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(next)),
        );
      }
    });

    ref.listen<LogInState>(logInControllerProvider, (previous, next) {
      if (next.isLogInSucces == true && next.user != null) {
        final user = next.user!;
        print("Login listener user: $user");

        ref.read(accountProvider.notifier).setAccount(user);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          context.go('/home');
        });
      }
    });

    return Padding(
      padding: const EdgeInsets.all(kMedium),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            AuthTextField(
              controller: _emailController,
              label: 'Email',
              icon: Icons.email,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: kMedium),
            AuthTextField(
              controller: _passwordController,
              label: 'Password',
              icon: Icons.lock,
              obscure: true,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: kExtraLarge),
            ElevatedButton(
              onPressed: isLoading ? null : _onSubmit,
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text('Log In'),
            ),
            const SizedBox(height: kExtraLarge),
            TextButton(
              onPressed: () => context.go('/sign_up'),
              child: Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }

 

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final request = LogInRequest(
      email: _emailController.text,
      password: _passwordController.text,
    );
    print("Log In Request: $request");
    ref.read(logInControllerProvider.notifier).logIn(request);
  }

  void _clearControllers() {
    _emailController.clear();
    _passwordController.clear();
  }
}

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscure;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscure = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(kSmall)),
        ),
        prefixIcon: Icon(icon),
      ),
    );
  }
}