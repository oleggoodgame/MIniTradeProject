import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/data/style/style.dart';
import 'package:mini_cash/data/style/widgets/text_controller_widget.dart';
import 'package:mini_cash/domain/log_in/data/repository/request/log_in_request.dart';
import 'package:mini_cash/domain/log_in/presentation/controller/log_in_controller.dart';
import 'package:mini_cash/domain/log_in/presentation/state/log_in_state.dart';
import 'package:mini_cash/domain/reset_password/send_email_reset/presentation/send_email_reset_presentation.dart';
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
  void dispose() {
    _clearControllers();
    super.dispose();
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
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(next, style: Theme.of(context).textTheme.titleLarge),
          ),
        );
      }
    });

    ref.listen<LogInState>(logInControllerProvider, (previous, next) {
      if (next.isLogInSucces == true && next.user != null) {
        final user = next.user!;
        // print("Login listener user: $user");

        ref.read(accountProvider.notifier).setAccount(user);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          ////////////////////////////////////////
          if (!mounted) return;
          context.go('/home');
        });
      }
    });

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(pMedium),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    "GET STARTED NOW!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                const SizedBox(height: kExtraLarge),

                TextControllerWidget(
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

                TextControllerWidget(
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
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kMedium),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Log In'),
                ),

                const SizedBox(height: kLarge),

                Center(child: SendEmailResetPresentation()),

                const SizedBox(height: kSmall),

                TextButton(
                  onPressed: () => context.go('/sign_up'),
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
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
    // print("Log In Request: $request");
    ref.read(logInControllerProvider.notifier).logIn(request);
  }

  void _clearControllers() {
    _emailController.clear();
    _passwordController.clear();
  }
}
