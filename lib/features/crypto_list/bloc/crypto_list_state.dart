part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.cryptoCoinsList});

  final List<CryptoCoin> cryptoCoinsList;

  @override
  List<Object?> get props => [cryptoCoinsList];
}

class CryptoCoinsListLoadingFailure extends CryptoListState {
  CryptoCoinsListLoadingFailure({this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
