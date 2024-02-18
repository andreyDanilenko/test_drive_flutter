import 'package:flutter/material.dart';
import 'package:test_drive/features/crypto_list_screen/widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.inversePrimary,
          title: const Text('Crypto list Screen'),
        ),
        body: ListView.separated(
            itemBuilder: (context, i) {
              return const CryptoCoinsListWidget();
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 10));
  }
}
