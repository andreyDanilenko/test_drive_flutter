import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_drive/features/crypto_list/widgets/widgets.dart';
import 'package:test_drive/repositories/crypto_coins/crypto_coins.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('Crypto List'),
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return CryptoListWidget(coin: coin);
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _cryptoCoinsList!.length),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList =
        await GetIt.I<AbstractCryptoCoinsRepository>().getCryptoCoinsList();
    setState(() {});
  }
}
