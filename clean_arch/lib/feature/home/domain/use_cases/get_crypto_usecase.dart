import 'package:clean_arch/configs/arch_core/base_use_case.dart';
import 'package:clean_arch/configs/arch_core/error_model.dart';
import 'package:clean_arch/configs/network/network_response_model.dart';
import 'package:clean_arch/feature/home/data/model/crypto_currency_list_response_model.dart';
import 'package:clean_arch/feature/home/data/repository/home_repository.dart';
import 'package:clean_arch/feature/home/domain/entities/crypto_currency.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCryptoUseCase extends BaseNoParamUseCase<List<CryptoCurrencyEntity>, AppError> {
  final HomeRepository repository;

  GetCryptoUseCase(this.repository);

  @override
  Future<Result<List<CryptoCurrencyEntity>, AppError>> call() async {
    final NetworkResponseModel<CryptoCurrencyList> data = await repository.getCryptoCurrencies();
    if (data.status == Status.successful && data.data != null) {
      final List<CryptoCurrencyEntity> cryptoCurrencies = data.data!.data!
          .map((CryptoCurrency cryptoCurrency) => cryptoCurrency.toEntity())
          .toList();
      return Result.success(cryptoCurrencies);
    } else {
      return Result.failure(CustomError(data.message));
    }
  }
}
