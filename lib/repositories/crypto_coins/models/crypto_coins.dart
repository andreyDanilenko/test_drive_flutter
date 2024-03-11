import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin(
      {required this.priceInUSD, required this.name, required this.imageUrl});

  final double priceInUSD;
  final String name;
  final String imageUrl;

  @override
  List<Object> get props => [priceInUSD, name, imageUrl];
}
