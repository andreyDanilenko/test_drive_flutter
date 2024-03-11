import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/repositories/crypto_coins/abstract_crypto_coins_repository.dart';
import 'package:test_drive/repositories/crypto_coins/models/crypto_coins.dart';
part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.cryptoCoinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoListEvent>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final cryptoCoinsList =
            await cryptoCoinsRepository.getCryptoCoinsList();
        emit(CryptoListLoaded(cryptoCoinsList: cryptoCoinsList));
      } catch (e) {
        emit(CryptoCoinsListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  AbstractCryptoCoinsRepository cryptoCoinsRepository;
}
