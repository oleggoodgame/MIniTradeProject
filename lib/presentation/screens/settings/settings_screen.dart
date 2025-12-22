import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/data/style/widgets/settings_widget.dart';
import 'package:mini_cash/presentation/providers/account_provider.dart';

class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(
        children: [
          const AccountHeader(),

          Spacer(),
          SettingsCard(
            title: "Description",
            subtitle: "What I want to achieve with this app",
            icon: Icons.description,
            onTap: () {
              context.pushNamed('description');
            },
          ),
          SettingsCard(
            title: "News",
            subtitle: "News about economy",
            icon: Icons.newspaper,
            onTap: () {
              context.push('/news', extra: 20);
            },
          ),
          SettingsCard(
            title: "Favorites",
            subtitle: "See all your favorite coins",
            icon: Icons.favorite,
            onTap: () {
              context.push('/favorites');
            },
          ),
          SettingsCard(
            title: "Account Settings",
            subtitle: "Manage your account settings",
            icon: Icons.manage_accounts_sharp,
            onTap: () {
              context.pushNamed('account_settings');
            },
          ),
          SettingsCard(
            title: "Sign out",
            subtitle: "Sign out of your account",
            icon: Icons.output_sharp,
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              ref.read(accountProvider.notifier).clear();
            },
          ),
        ],
      ),
    );
  }
}


class AccountHeader extends ConsumerWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProvider);
    final theme = Theme.of(context);

    if (account == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withOpacity(0.15),
            theme.colorScheme.primary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 28,
            backgroundColor: theme.colorScheme.primary,
            child: Text(
              account.name.isNotEmpty ? account.name[0].toUpperCase() : '?',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(account.name, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  account.email,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.verified, color: Colors.green),
        ],
      ),
    );
  }
}
