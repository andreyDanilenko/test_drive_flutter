part of 'crypto_list_bloc.dart';

class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {
  // @override
  // List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.cryptoCoinsList});

  final List<CryptoCoin> cryptoCoinsList;
}

class CryptoCoinsListLoadingFailure extends CryptoListState {
  CryptoCoinsListLoadingFailure({this.exception});

  final Object? exception;

  // @override
  // List<Object?> get props => [exception];
}
