import 'package:injectable/injectable.dart';

import 'base_data_source.dart';


@Injectable(as: BaseDataSource)
class ConcreteDataSource extends BaseDataSource {
  ConcreteDataSource(super.networkUtil);
}