import 'package:clean_arch/configs/arch_core/concrete_data_source.dart';
import 'package:clean_arch/configs/network/network_response_model.dart';
import 'package:clean_arch/feature/home/data/model/crypto_currency_list_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDataSource {
  Future<NetworkResponseModel<CryptoCurrencyList>> getCryptoCurrencies();
}

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends ConcreteDataSource implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(super.networkUtil);

  @override
  Future<NetworkResponseModel<CryptoCurrencyList>> getCryptoCurrencies() {
    return request(
          () => networkUtil.get("tickers/"),
          (data) => CryptoCurrencyList.fromJson(data ?? {}),
    );
  }
}
