import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/entity/coin_entity.dart';
import 'package:mini_cash/presentation/providers/account_provider.dart';
import 'package:mini_cash/presentation/providers/isLoading_provider.dart';
import 'package:mini_cash/presentation/screens/authentication/log_in_screen.dart';
import 'package:mini_cash/presentation/screens/authentication/sign_up_screen.dart';
import 'package:mini_cash/presentation/screens/coin_screen.dart';
import 'package:mini_cash/presentation/screens/settings/account_settings_screen.dart';
import 'package:mini_cash/presentation/screens/settings/description_screen.dart';
import 'package:mini_cash/presentation/screens/settings/favorites_screen.dart';
import 'package:mini_cash/presentation/screens/home_screen.dart';
import 'package:mini_cash/presentation/screens/list_trade_screen.dart';
import 'package:mini_cash/presentation/screens/loading_screen.dart';
import 'package:mini_cash/presentation/screens/settings/news_screen.dart';
import 'package:mini_cash/presentation/screens/search_bar_screen.dart';
import 'package:mini_cash/presentation/screens/settings/password_scree.dart';
import 'package:mini_cash/presentation/screens/settings/settings_screen.dart';
import 'package:mini_cash/presentation/screens/settings/tabs_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final isLoading = ref.watch(isLoadingProvider);
  final account = ref.watch(accountProvider);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    refreshListenable: ref.watch(routerRefreshProvider),
    redirect: (context, state) {
      if (isLoading) return '/loading';

      final isLoggingIn = state.matchedLocation == '/log_in';
      final isSigningUp = state.matchedLocation == '/sign_up';
      print(state.matchedLocation);
      print(account?.id);
      print(isLoggingIn);
      print(isSigningUp);

      if (account == null || !account.isLoggedIn) {
        if (isLoggingIn || isSigningUp) return null;
        return '/log_in';
      }

      if (isLoggingIn || isSigningUp) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/loading',
        name: 'loading',
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/log_in',
        name: 'log_in',
        builder: (context, state) => const LogInScreen(),
      ),
      GoRoute(
        path: '/sign_up',
        name: 'sign_up',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/favorites',
        name: 'favorites',
        builder: (context, state) => const FavoritesScreen(),
      ),
      // GoRoute(
      //   path: '/list_trade',
      //   name: 'list_trade',
      //   builder: (context, state) => const ListTradeScreen(),
      // ),
      GoRoute(
        path: '/search_bar',
        name: 'search_bar',
        builder: (context, state) => const SearchBarScreen(),
      ),
      // GoRoute(
      //   path: '/home',
      //   name: 'home',
      //   builder: (context, state) => const HomeScreen(),
      // ),
      // GoRoute(
      //   path: '/coin',
      //   name: 'coin',

      //   builder: (context, state) {
      //     final coin = state.extra as String;
      //     return CoinScreen(symbol: coin);
      //   },
      // ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return TabsScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/list_trade',
                builder: (context, state) => const ListTradeScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => SettingsScreen(),
                routes: [
                  GoRoute(
                    path: '/desription',
                    name: 'description',
                    builder: (context, state) {
                      return const DescriptionScreen();
                    },
                  ),
                  GoRoute(
                    path: '/account_settings',
                    name: 'account_settings',
                    builder: (context, state) {
                      return const AccountSettingsScreen();
                    },
                    routes: [
                      GoRoute(
                        path: '/password',
                        name: 'password',
                        builder: (context, state) => const PasswordScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      /// ===== DETAILS (OVERLAY) =====
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/coin',
        name: 'coin',
        builder: (context, state) {
          final coin = state.extra as CoinEntity; // беремо CoinEntity
          return CoinScreen(coin: coin);
        },
      ),

      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/news',
        name: 'news',

        builder: (context, state) {
          final limit = state.extra as int;
          return NewsScreen(limit: limit);
        },
      ),
    ],
  );
});
