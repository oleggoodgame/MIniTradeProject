import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cash/data/database/theme_database.dart';
import 'package:mini_cash/data/style/dark_style.dart';
import 'package:mini_cash/data/style/light_style.dart';
import 'package:mini_cash/domain/search/data/databaselocal_data.dart';
import 'package:mini_cash/domain/search/data/databaseremote_data.dart';
import 'package:mini_cash/domain/search/repository/search_repository.dart';
import 'package:mini_cash/firebase_options.dart';
import 'package:mini_cash/navigation/go_route.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_cash/presentation/providers/account_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final repo = CoinsRepositoryImpl(
    local: CoinsLocalDataSource(),
    remote: CoinsRemoteDataSource(),
  );

  await repo.syncCoins();

  // У Riverpod все живе всередині контейнера. Контейнер — це фактично «середовище», де зберігається стан всіх провайдерів.

  // Коли ти звичайно використовуєш Provider/StateNotifierProvider у UI, Flutter автоматично створює контейнер для тебе всередині ProviderScope.

  // Але позa UI, наприклад у main() до runApp(), контейнера немає. Тому якщо ти хочеш викликати методи провайдерів (init(), read()) ще до UI, тобі потрібен свій контейнер:

  final container = ProviderContainer();
  final accountNotifier = container.read(accountProvider.notifier);
  await accountNotifier.init();
  // final symbols = await buildShortMap();
  // print(symbols);
  // final symbolSet = HashSet<String>.from(symbols);

  // print("\n\n\n\n");
  // if (symbolSet.contains('BTCUSDT')) {
  //   print('Є така монета');
  // }
  // final filtered = symbols.where((s) => s.startsWith('KI')).toList();

  // print(filtered);
  runApp(UncontrolledProviderScope(container: container, child: MainApp()));
}

Future<Map<String, List<String>>> buildShortMap() async {
  final url = Uri.parse('https://api.binance.com/api/v3/exchangeInfo');
  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception("Binance API error");
  }

  final data = jsonDecode(response.body);
  final symbols = data['symbols'] as List<dynamic>;

  final Map<String, List<String>> shortMap = {};

  // Найпопулярніші quote-валюти
  const trackedQuotes = {"USDT", "USD"};

  for (var s in symbols) {
    if (s['status'] != 'TRADING') continue;

    final base = s['baseAsset']; // BTC
    final quote = s['quoteAsset']; // USDT
    final symbol = s['symbol']; // BTCUSDT

    // беремо лише USDT, USD
    if (!trackedQuotes.contains(quote)) continue;

    // додаємо baseAsset → список символів (з лапками)
    shortMap.putIfAbsent('"$base"', () => []);
    shortMap['"$base"']!.add('"$symbol"');
  }

  return shortMap;
}

Future<List<String>> getActiveSymbols() async {
  final url = Uri.parse('https://api.binance.com/api/v3/exchangeInfo');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final symbols = data['symbols'] as List<dynamic>;
    // Відбираємо лише ті, що в статусі TRADING
    final active = symbols
        .where((s) => s['status'] == 'TRADING')
        .map((s) => '"${s['baseAsset']}"')
        .toList();
    return active;
  } else {
    throw Exception('Failed to load symbols');
  }
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final themeState = ref.watch(themeControllerProvider);

    if (themeState == AppThemeMode.loading) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp.router(
      routerConfig: router,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _mapThemeMode(themeState),
    );
  }

  ThemeMode _mapThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
      default:
        return ThemeMode.system;
    }
  }
}
