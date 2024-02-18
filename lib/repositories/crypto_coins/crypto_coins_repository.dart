import 'package:dio/dio.dart';
import 'package:test_drive/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinsRepository implements AbstractCryptoCoinsRepository {
  final Dio dio;

  const CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoins>> getCryptoCoinsList() async {
    try {
      final response = await dio.get(
          'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB,COMP,ENJ,IOTX,LINK,LUNA&tsyms=USD,EUR');
      final data = response.data as Map<String, dynamic>;
      final cryptoCoinsList = data.entries
          .map((e) => CryptoCoins(
              priceInUSD: (e.value as Map<String, dynamic>)['USD'],
              name: e.key))
          .toList();

      return cryptoCoinsList;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

// https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB,COMP,ENJ,IOTX,LINK,LUNA&tsyms=USD,EUR
// https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,COMP,ENJ,IOTX,LINK,LUNA&tsyms=USD,EUR