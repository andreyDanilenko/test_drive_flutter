import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_drive/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:test_drive/features/crypto_list/widgets/crypto_coins_error.dart';
import 'package:test_drive/features/crypto_list/widgets/widgets.dart';
import 'package:test_drive/repositories/crypto_coins/crypto_coins.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc =
      CryptoListBloc(GetIt.I<AbstractCryptoCoinsRepository>());

  @override
  void initState() {
    // _loadCryptoCoins();
    _cryptoListBloc.add(LoadCryptoListEvent());
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
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoListEvent(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                  itemBuilder: (context, i) {
                    final coin = state.cryptoCoinsList[i];
                    return CryptoListWidget(coin: coin);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.cryptoCoinsList.length);
            }
            if (state is CryptoCoinsListLoadingFailure) {
              return CryptoCoinsErrorWidget(cryptoListBloc: _cryptoListBloc);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  // Future<void> _loadCryptoCoins() async {
  //   _cryptoCoinsList =
  //       await GetIt.I<AbstractCryptoCoinsRepository>().getCryptoCoinsList();
  //   setState(() {});
  // }
}
