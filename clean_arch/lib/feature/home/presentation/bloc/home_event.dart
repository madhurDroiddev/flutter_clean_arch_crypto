part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadCryptoCurrencies extends HomeEvent {}

class SortCryptoCurrencies extends HomeEvent {
  final SortType sortType;

  SortCryptoCurrencies(this.sortType);
}
