
import 'dart:async';
import 'package:clean_arch/feature/home/domain/entities/crypto_currency.dart';
import 'package:clean_arch/feature/home/domain/use_cases/get_crypto_usecase.dart';
import 'package:clean_arch/feature/home/domain/use_cases/sort_crypto_by_name_usecase.dart';
import 'package:clean_arch/feature/home/domain/use_cases/sort_crypto_by_price_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCryptoUseCase getCryptoListUseCase;
  final SortCryptoByNameUseCase sortCryptoByNameUseCase;
  final SortCryptoByPriceUseCase sortCryptoByPriceUseCase;

  HomeBloc(this.getCryptoListUseCase, this.sortCryptoByNameUseCase, this.sortCryptoByPriceUseCase) : super(HomeInitial()) {
    on<LoadCryptoCurrencies>(_onLoadCryptoCurrencies);
    on<SortCryptoCurrencies>(_onSortCryptoCurrencies);
  }

  Future<void> _onLoadCryptoCurrencies(
      LoadCryptoCurrencies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    final result = await getCryptoListUseCase.call();

    result.fold(
      success: (data) => emit(HomeLoaded(data)),
      failure: (error) => emit(HomeError(error.message)),
    );
  }

  FutureOr<void> _onSortCryptoCurrencies(SortCryptoCurrencies event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      final cryptoList = currentState.cryptoList;
      final sortedList = await (event.sortType == SortType.name
          ? sortCryptoByNameUseCase(cryptoList)
          : sortCryptoByPriceUseCase(cryptoList));

      sortedList.fold(
        success: (data) => emit(HomeLoaded(data)),
        failure: (error) => emit(HomeError(error.message)),
      );
    }
  }
}
