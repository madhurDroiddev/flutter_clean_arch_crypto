import 'package:clean_arch/configs/network/network_response_model.dart';
import 'package:clean_arch/feature/home/data/model/crypto_currency_list_response_model.dart';

abstract class HomeRepository {
  Future<NetworkResponseModel<CryptoCurrencyList>> getCryptoCurrencies();
}