import 'package:clean_arch/configs/dependency/core/injection_container.dart';
import 'package:clean_arch/feature/home/presentation/bloc/home_bloc.dart';
import 'package:cryptofont/cryptofont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(LoadCryptoCurrencies()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                getIt<HomeBloc>().add(LoadCryptoCurrencies());
              },
            ),
          ],
          title: const Text(
            'Cryptocurrencies',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<HomeBloc>().add(SortCryptoCurrencies(SortType.name));
                          },
                          child: Row(
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                              const SizedBox(width: 10),
                              Icon(Icons.sort_by_alpha_rounded,color: Colors.grey.shade700)
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<HomeBloc>().add(SortCryptoCurrencies(SortType.price));
                          },
                          child: Row(
                            children: [
                              Text(
                                'Price (USD)',
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                              const SizedBox(width: 10),
                              Icon(Icons.sort_rounded,color: Colors.grey.shade700)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.cryptoList.length,
                        itemBuilder: (context, index) {
                          final crypto = state.cryptoList[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: ListTile(
                              title: Text(crypto.name),
                              leading: Icon(
                                crypto.symbol.isNotEmpty
                                    ? CryptoFontIcons.fromSymbol(crypto.symbol)
                                    : Icons.currency_bitcoin,
                              ),
                              trailing: Text('\$${crypto.priceUsd}',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          );
                        }),
                  ),
                ],
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
