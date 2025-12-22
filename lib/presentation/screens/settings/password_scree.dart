import 'package:flutter/material.dart';
import 'package:mini_cash/domain/reset_password/presentation/reset_password_presentation.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: const Center(
        child: ResetPasswordPresentation(),
      ),
    );
  }
}