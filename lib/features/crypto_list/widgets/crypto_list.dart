import 'package:flutter/material.dart';
import 'package:test_drive/repositories/crypto_coins/crypto_coins.dart';

class CryptoListWidget extends StatelessWidget {
  const CryptoListWidget({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
        leading: Image.network(coin.imageUrl),
        title: Text(coin.name, style: theme.textTheme.bodyMedium),
        subtitle:
            Text('${coin.priceInUSD} \$', style: theme.textTheme.bodySmall),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        onTap: () {
          Navigator.of(context)
              .pushNamed('/detail-crypto-coin', arguments: coin);
        });
  }
}
