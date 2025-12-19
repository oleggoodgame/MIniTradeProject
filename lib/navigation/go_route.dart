import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/presentation/providers/account_provider.dart';
import 'package:mini_cash/presentation/providers/isLoading_provider.dart';
import 'package:mini_cash/presentation/screens/authentication/log_in_screen.dart';
import 'package:mini_cash/presentation/screens/authentication/sign_up_screen.dart';
import 'package:mini_cash/presentation/screens/coin_screen.dart';
import 'package:mini_cash/presentation/screens/home_screen.dart';
import 'package:mini_cash/presentation/screens/list_trade_screen.dart';
import 'package:mini_cash/presentation/screens/loading_screen.dart';
import 'package:mini_cash/presentation/screens/search_bar_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final isLoading = ref.watch(isLoadingProvider);
  final account = ref.watch(accountProvider);
  return GoRouter(
    initialLocation: '/list_trade',
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
        path: '/list_trade',
        name: 'list_trade',
        builder: (context, state) => const ListTradeScreen(),
      ),
      GoRoute(
        path: '/search_bar',
        name: 'search_bar',
        builder: (context, state) => const SearchBarScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/coin',
        name: 'coin',

        builder: (context, state) {
          final coin = state.extra as String;
          return CoinScreen(symbol: coin);
        },
      ),
    ],
  );
});
