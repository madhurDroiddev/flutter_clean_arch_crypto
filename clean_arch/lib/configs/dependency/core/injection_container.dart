import 'package:clean_arch/configs/dependency/core/injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

bool testing = false;
final getIt = GetIt.instance;

@InjectableInit(initializerName: 'init')
Future<void> configureDependencies() async => getIt.init(
      environment: Environment.prod,
    );
