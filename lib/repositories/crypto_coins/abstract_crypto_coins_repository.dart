import 'package:test_drive/repositories/crypto_coins/models/models.dart';

abstract class AbstractCryptoCoinsRepository {
  Future<List<CryptoCoins>> getCryptoCoinsList();
}
