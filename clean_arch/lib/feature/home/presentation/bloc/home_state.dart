part of 'home_bloc.dart';

enum SortType { name, price }

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CryptoCurrencyEntity> cryptoList;

  HomeLoaded(this.cryptoList);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

