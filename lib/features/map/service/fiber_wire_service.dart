import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/map/models/fiber_wire_model.dart';

class FiberWireService {
  Future<List<FiberModel>> getFiberWireData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .getRequest<FiberModel>("api/master-wire/?type=fiber", isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      var data = (response.data as List)
          .map((item) => FiberModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return data;
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
