import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/data/database/firebase_database.dart';
import 'package:mini_cash/data/database/theme_database.dart';
import 'package:mini_cash/data/style/widgets/settings_widget.dart';
import 'package:mini_cash/presentation/providers/account_provider.dart';

class AccountSettingsScreen extends ConsumerWidget {
  const AccountSettingsScreen({super.key});
  Future<void> showChangeDialog({
    required BuildContext context,
    required WidgetRef ref,
    required String title,
    required Future<void> Function(String value) onSubmit,
  }) async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        // додати ще потім shadow, погратись з тим
        return AlertDialog(
          icon: Icon(Icons.settings),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text("Change $title"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: "Enter new $title",
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final value = controller.text.trim();
                if (value.isEmpty) return;

                await onSubmit(value);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Settings")),
      body: Column(
        children: [
          ThemeSwitch(),
          SettingsCard(
            title: "Change password",
            subtitle: "Change your account password",
            icon: Icons.edit,
            onTap: () async {
              context.pushNamed('password');
            },
          ),
          SettingsCard(
            title: "Change name",
            subtitle: "Change your account name",
            icon: Icons.edit,
            onTap: () async {
              await showChangeDialog(
                context: context,
                ref: ref,
                title: "name",
                onSubmit: (value) async {
                  await ref
                      .read(firebaseDatabaseProvider)
                      .updateAccountName(value);
                  await ref.read(accountProvider.notifier).refreshAccount();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Поточний стан теми
    final isDark = ref.watch(themeControllerProvider) == AppThemeMode.dark;

    return Switch.adaptive(
      value: isDark,
      activeColor: Colors.deepPurple,
      inactiveThumbColor: Colors.grey.shade300,
      inactiveTrackColor: Colors.grey.shade400,
      onChanged: (_) {
        if (isDark) {
          ref
              .read(themeControllerProvider.notifier)
              .setTheme(
                AppThemeMode.light,
              );
          return;
        }
        ref
            .read(themeControllerProvider.notifier)
            .setTheme(
              AppThemeMode.dark,
            ); // Тут можна додати логіку для перемикання між режимами
      },
    );
  }
}
