import 'package:clean_arch/configs/network/network_response_model.dart';
import 'package:clean_arch/feature/home/data/model/crypto_currency_list_response_model.dart';
import 'package:clean_arch/feature/home/data/repository/home_repository.dart';
import 'package:clean_arch/feature/home/data/sources/remote/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<NetworkResponseModel<CryptoCurrencyList>> getCryptoCurrencies() async {
    try {
      final data = await remoteDataSource.getCryptoCurrencies();
      return data;
    } catch (e) {
      return NetworkResponseModel(
        status: Status.failure,
        error: ErrorModel.unknown,
        message: "An unexpected error occurred: $e",
      );
    }
  }
}
