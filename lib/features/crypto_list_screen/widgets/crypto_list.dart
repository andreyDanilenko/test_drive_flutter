import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinsListWidget extends StatelessWidget {
  const CryptoCoinsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
        leading: SvgPicture.asset(
          'assets/images/svg/grooming_fish.svg',
          height: 25,
          width: 25,
        ),
        title: Text('Crypto item widget', style: theme.textTheme.bodyMedium),
        subtitle: Text('subPost', style: theme.textTheme.bodySmall),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        onTap: () {
          Navigator.of(context).pushNamed('/detail-crypto-coin');
        });
  }
}
