import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/map/models/location_model.dart';

class LocationService {
  Future<List<Location>> getLocationData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .getRequest<List<dynamic>>("api/location/", isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      List<dynamic> jsonData = response.data;
      var data = jsonData
          .map((item) => Location.fromJson(item as Map<String, dynamic>))
          .toList();

      return data;
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
