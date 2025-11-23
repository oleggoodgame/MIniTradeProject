import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_cash/domain/list_trade/presentation/list_trade_presentation.dart';

class ListTradeScreen extends StatefulWidget {
  const ListTradeScreen({super.key});

  @override
  State<ListTradeScreen> createState() => _ListTradeScreenState();
}

class _ListTradeScreenState extends State<ListTradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Trade Screen"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.push(
                "/search_bar",
              );
            },
          ),
        ],
      ),
      body: ListTradePresentation(),
    );
  }
}