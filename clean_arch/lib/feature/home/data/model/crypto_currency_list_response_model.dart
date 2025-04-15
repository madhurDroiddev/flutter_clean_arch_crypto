import 'package:clean_arch/feature/home/domain/entities/crypto_currency.dart';

class CryptoCurrencyList {
  List<CryptoCurrency>? data;
  Info? info;

  CryptoCurrencyList({this.data, this.info});

  CryptoCurrencyList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CryptoCurrency>[];
      json['data'].forEach((v) {
        data!.add(CryptoCurrency.fromJson(v));
      });
    }
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }
}

class CryptoCurrency {
  String? id;
  String? symbol;
  String? name;
  String? nameid;
  int? rank;
  String? priceUsd;
  String? percentChange24h;
  String? percentChange1h;
  String? percentChange7d;
  String? priceBtc;
  String? marketCapUsd;
  double? volume24;
  double? volume24a;
  String? csupply;
  String? tsupply;
  String? msupply;

  CryptoCurrency(
      {this.id,
        this.symbol,
        this.name,
        this.nameid,
        this.rank,
        this.priceUsd,
        this.percentChange24h,
        this.percentChange1h,
        this.percentChange7d,
        this.priceBtc,
        this.marketCapUsd,
        this.volume24,
        this.volume24a,
        this.csupply,
        this.tsupply,
        this.msupply});

  CryptoCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    nameid = json['nameid'];
    rank = json['rank'];
    priceUsd = json['price_usd'];
    percentChange24h = json['percent_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange7d = json['percent_change_7d'];
    priceBtc = json['price_btc'];
    marketCapUsd = json['market_cap_usd'];
    volume24 = json['volume24'];
    volume24a = json['volume24a'];
    csupply = json['csupply'];
    tsupply = json['tsupply'];
    msupply = json['msupply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    data['nameid'] = nameid;
    data['rank'] = rank;
    data['price_usd'] = priceUsd;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_7d'] = percentChange7d;
    data['price_btc'] = priceBtc;
    data['market_cap_usd'] = marketCapUsd;
    data['volume24'] = volume24;
    data['volume24a'] = volume24a;
    data['csupply'] = csupply;
    data['tsupply'] = tsupply;
    data['msupply'] = msupply;
    return data;
  }

  CryptoCurrencyEntity toEntity() {
    return CryptoCurrencyEntity(
      id: id!,
      name: name!,
      symbol: symbol!,
      priceUsd: double.parse(priceUsd!),
    );
  }
}

class Info {
  int? coinsNum;
  int? time;

  Info({this.coinsNum, this.time});

  Info.fromJson(Map<String, dynamic> json) {
    coinsNum = json['coins_num'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coins_num'] = coinsNum;
    data['time'] = time;
    return data;
  }
}