import 'dart:async';

/// Base class for parameterized use cases
abstract class BaseUseCase<T, E, Params> {
  FutureOr<Result<T, E>> call(Params params);
}

/// Base class for non-parameterized use cases
abstract class BaseNoParamUseCase<T, E> {
  FutureOr<Result<T, E>> call();
}

/// Enhanced Result class with separate success and error types
class Result<S, E> {
  final S? _data;
  final E? _error;

  bool get isSuccess => _error == null;

  Result.success(S this._data) : _error = null;
  Result.failure(E this._error) : _data = null;

  /// Pattern matching for handling both cases
  R fold<R>({
    required R Function(S successData) success,
    required R Function(E error) failure,
  }) {
    if (isSuccess) {
      return success(_data!);
    } else {
      return failure(_error!);
    }
  }
}