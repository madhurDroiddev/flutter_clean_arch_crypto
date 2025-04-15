import 'package:clean_arch/configs/network/network_response_model.dart';
import 'package:clean_arch/configs/network/network_util.dart';


abstract class BaseDataSource {
  final NetworkUtil networkUtil;

  BaseDataSource(this.networkUtil);

  /// Generic method to make API requests
  Future<NetworkResponseModel<T>> request<T>(
      Future<DioResponseModel> Function() apiCall,
      T Function(Map<String, dynamic>?) parser,
      ) async {
    try {
      // Make API call
      DioResponseModel response = await apiCall();

      // Process response using NetworkResponseModel
      return NetworkResponseModel.processRest(response, parser);
    } catch (e) {
      return NetworkResponseModel<T>(
        status: Status.failure,
        error: ErrorModel.unknown,
        message: "An unexpected error occurred: $e",
      );
    }
  }
}
