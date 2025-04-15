import 'package:clean_arch/configs/arch_core/base_use_case.dart';
import 'package:clean_arch/configs/arch_core/error_model.dart';
import 'package:clean_arch/feature/home/domain/entities/crypto_currency.dart';
import 'package:injectable/injectable.dart';

@injectable
class SortCryptoByPriceUseCase extends BaseUseCase<List<CryptoCurrencyEntity>,
    AppError, List<CryptoCurrencyEntity>> {
  @override
  Future<Result<List<CryptoCurrencyEntity>, AppError>> call(
      List<CryptoCurrencyEntity> params) async {
    try {
      List<CryptoCurrencyEntity> sortedList = List.from(params);
      sortedList.sort((a, b) => a.priceUsd.compareTo(b.priceUsd));

      return Result.success(sortedList);
    } catch (e) {
      return Result.failure(CustomError(e.toString()));
    }
  }
}
