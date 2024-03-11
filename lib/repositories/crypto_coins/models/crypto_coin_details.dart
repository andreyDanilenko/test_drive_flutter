import 'package:equatable/equatable.dart';

class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  final String toSymbol;
  final double hight24Hour;
  final DateTime lastUpdate;
  final double low24Hours;
  final double priceInUSD;
  final String imageUrl;

  @override
  List<Object> get props =>
      [toSymbol, hight24Hour, lastUpdate, low24Hours, priceInUSD, imageUrl];

  static fromJson(Map<String, dynamic> usdData) {}
}
