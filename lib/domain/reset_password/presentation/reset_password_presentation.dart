import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_cash/domain/reset_password/data/repository/request/reset_password_request.dart';
import 'package:mini_cash/domain/reset_password/repository/reset_password_repository.dart';
import 'package:mini_cash/data/style/widgets/text_controller_widget.dart';
import 'package:mini_cash/domain/reset_password/send_email_reset/presentation/send_email_reset_presentation.dart';

class ResetPasswordPresentation extends ConsumerStatefulWidget {
  const ResetPasswordPresentation({super.key});

  @override
  ConsumerState<ResetPasswordPresentation> createState() =>
      _ResetPasswordPresentationState();
}

class _ResetPasswordPresentationState
    extends ConsumerState<ResetPasswordPresentation> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _oldPasswordController;
  late final TextEditingController _newPasswordController;

  String? _oldPasswordError;
  String? _newPasswordError;

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onChangePassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _oldPasswordError = null;
      _newPasswordError = null;
    });

    final repository = ref.read(resetPasswordRepositoryProvider);

    try {
      await repository.resetPassword(
        ResetPasswordRequest(
          email: FirebaseAuth.instance.currentUser!.email!,
          oldPassword: _oldPasswordController.text,
          newPassword: _newPasswordController.text,
        ),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password changed successfully ✅')),
        );
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        switch (e.code) {
          case 'wrong-password':
            _oldPasswordError = 'Старий пароль неправильний';
            break;
          case 'weak-password':
            _newPasswordError = 'Новий пароль занадто слабкий';
            break;
          case 'requires-recent-login':
            _oldPasswordError = 'Увійди в акаунт ще раз';
            break;
          default:
            _oldPasswordError = e.message;
        }
      });
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'Enter your old password and new password',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),

          TextControllerWidget(
            controller: _oldPasswordController,
            label: 'Old password',
            icon: Icons.lock,
            obscure: true,
            errorText: _oldPasswordError,
            validator: (value) =>
                value == null || value.isEmpty ? 'Enter old password' : null,
          ),

          const SizedBox(height: 12),

          TextControllerWidget(
            controller: _newPasswordController,
            label: 'New password',
            icon: Icons.lock,
            obscure: true,
            errorText: _newPasswordError,
            validator: (value) =>
                value == null || value.length < 8
                    ? 'Minimum 8 characters'
                    : null,
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: _loading ? null : _onChangePassword,
            child: _loading
                ? const CircularProgressIndicator()
                : const Text('Change password'),
          ),

          SendEmailResetPresentation(),
        ],
      ),
    );
  }
}
