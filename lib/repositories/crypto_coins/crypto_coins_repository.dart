import 'package:dio/dio.dart';
import 'package:test_drive/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinsRepository implements AbstractCryptoCoinsRepository {
  final Dio dio = Dio();

  // const CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoin>> getCryptoCoinsList() async {
    try {
      final response = await dio.get(
          'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,COMP,ENJ,IOTX,LINK,LUNA&tsyms=USD,EUR');
      final data = response.data as Map<String, dynamic>;
      final dataRow = data['RAW'] as Map<String, dynamic>;
      final cryptoCoinsList = dataRow.entries.map((e) {
        final usdData =
            (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
        final price = usdData['PRICE'];
        final imageUrl = usdData['IMAGEURL'];
        return CryptoCoin(
            imageUrl: 'https://cryptocompare.com/$imageUrl',
            priceInUSD: price,
            name: e.key);
      }).toList();
      // debugPrint(cryptoCoinsList.toString());
      return cryptoCoinsList;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

// https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB,COMP,ENJ,IOTX,LINK,LUNA&tsyms=USD,EUR
// https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,COMP,ENJ,IOTX,LINK,LUNA&tsyms=USD,EUR