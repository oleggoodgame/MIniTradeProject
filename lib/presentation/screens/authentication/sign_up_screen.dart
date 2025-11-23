import 'package:flutter/material.dart';
import 'package:mini_cash/domain/sign_up/presentation/sign_up_prs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    print("WOOOOOOOOOOOOOOOOO");
    return Scaffold(body: SignUpPresentation());
  }
}
