import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named("baseUrl")
  String get baseUrl => "https://api.coinlore.net/api/";
}
