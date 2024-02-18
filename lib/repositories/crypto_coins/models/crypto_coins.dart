// import 'package:equatable/equatable.dart';

class CryptoCoin {
  const CryptoCoin(
      {required this.priceInUSD, required this.name, required this.imageUrl});

  final double priceInUSD;
  final String name;
  final String imageUrl;
}
