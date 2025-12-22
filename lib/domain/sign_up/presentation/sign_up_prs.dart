import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/data/style/style.dart';
import 'package:mini_cash/data/style/widgets/text_controller_widget.dart';
import 'package:mini_cash/domain/sign_up/data/repository/request/sign_up_request.dart';
import 'package:mini_cash/domain/sign_up/presentation/controller/sign_up_cotroller.dart';
import 'package:mini_cash/presentation/providers/account_provider.dart';

class SignUpPresentation extends ConsumerStatefulWidget {
  const SignUpPresentation({super.key});

  @override
  ConsumerState<SignUpPresentation> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpPresentation> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  // void _setupListeners() {
  //   // Слухаємо помилки
  //   ref.listen(signUpControllerProvider.select((s) => s.error), (_, next) {
  //     if (next != null && mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(backgroundColor: Colors.red, content: Text(next)),
  //       );
  //     }
  //   });

  //   ref.listen(signUpControllerProvider.select((s) => s.isSignUpSuccess), (
  //     _,
  //     next,
  //   ) {
  //     if (next == true && mounted) {
  //       ref
  //           .read(accountProvider.notifier)
  //           .setAccount(ref.read(signUpControllerProvider).user);
  //       showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (_) => AlertDialog(
  //           title: Text('Sign Up Successful'.hardcoded),
  //           content: Text(
  //             'Please check your email for verification.'.hardcoded,
  //           ),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 context.pop();
  //                 _clearControllers();
  //                 context.go('/login');
  //               },
  //               child: Text('OK'.hardcoded),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   });
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpControllerProvider);
    final isLoading = state.isLoading;

    ref.listen<bool>(
      signUpControllerProvider.select((s) => s.isSignUpSuccess??false),
      (previous, next) {
        if (next == true && mounted) {
          final account = state.user;
          if (account != null) {
            ref.watch(accountProvider.notifier).setAccount(account);
          }
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              title: const Text('Sign Up Successful'),
              content: const Text('Please check your email for verification.'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                    _clearControllers();
                    context.go('/login');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
    );
    return Padding(
      padding: const EdgeInsets.all(kMedium),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextControllerWidget(
              controller: _nameController,
              label: 'Name',
              icon: Icons.person,
              validator: (v) =>
                  v == null || v.isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: kMedium),
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
                if (v == null || v.isEmpty) return 'Please enter your password';
                if (v.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: kMedium),
            TextControllerWidget(
              controller: _confirmPasswordController,
              label: 'Confirm Password',
              icon: Icons.lock,
              obscure: true,
              validator: (v) {
                if (v != _passwordController.text) {
                  return 'Passwords do not match';
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
                  : Text('Signcffffffffffff Up'.hardcoded),
            ),
            const SizedBox(height: kExtraLarge),
            TextButton(
              onPressed: () => context.go('/login'),
              child: Text('Already have an account? dffdgfhtyhtyjytuyuLog in'.hardcoded),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildTextField({
  //   required TextEditingController controller,
  //   required String label,
  //   required IconData icon,
  //   bool obscure = false,
  //   String? Function(String?)? validator,
  // }) {
  //   return TextFormField(
  //     controller: controller,
  //     obscureText: obscure,
  //     validator: validator,
  //     decoration: InputDecoration(
  //       labelText: label.hardcoded,
  //       border: const OutlineInputBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(kSmall)),
  //       ),
  //       prefixIcon: Icon(icon),
  //     ),
  //   );
  // }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final request = SignUpRequest(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    ref.read(signUpControllerProvider.notifier).signUp(request);
  }

  void _clearControllers() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }
}

extension on String {
  String get hardcoded => toUpperCase();
}
