import 'package:flutter/material.dart';
import 'package:mini_cash/domain/log_in/presentation/log_in_prs.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LogInPresentation(),);
  }
}