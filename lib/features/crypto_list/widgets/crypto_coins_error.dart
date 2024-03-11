import 'package:flutter/material.dart';
import 'package:test_drive/features/crypto_list/bloc/crypto_list_bloc.dart';

class CryptoCoinsErrorWidget extends StatelessWidget {
  const CryptoCoinsErrorWidget({
    super.key,
    required CryptoListBloc cryptoListBloc,
  }) : _cryptoListBloc = cryptoListBloc;

  final CryptoListBloc _cryptoListBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Something went wrong',
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          'Please try again later',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: () {
            _cryptoListBloc.add(LoadCryptoListEvent());
          },
          child: Text(
            'Try again',
            style: theme.textTheme.bodySmall,
          ),
        )
      ],
    ));
  }
}
