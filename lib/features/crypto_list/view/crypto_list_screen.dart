import 'package:flutter/material.dart';
import 'package:test_drive/features/crypto_list/widgets/widgets.dart';

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
          title: const Text('Crypto tile Screen'),
        ),
        body: ListView.separated(
            itemBuilder: (context, i) {
              return const CryptoCoinsTileWidget();
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 10));
  }
}
