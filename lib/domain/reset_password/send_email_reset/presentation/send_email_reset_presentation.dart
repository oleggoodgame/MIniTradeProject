import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/domain/reset_password/send_email_reset/data/source/send_enail_reset_api.dart';

class SendEmailResetPresentation extends ConsumerWidget {
  const SendEmailResetPresentation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(sendResetApiProvider).sendResetEmail();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Password reset email has been sent. Please check your inbox 📩',
              ),
            ),
          );
        }
      },
      child: Text(
        'Send Password Reset Email',
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(color: Colors.blue),
      ),
    );
  }
}
