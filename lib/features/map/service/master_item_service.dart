import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/map/models/master_item_model.dart';

class MasterItemService {
  Future<List<MasterItem>> getMasterItemData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>().getRequest<List<MasterItem>>(
          "api/master-item/?page_size=0",
          isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      if (response.data is List) {
        var data = (response.data as List)
            .map((item) => MasterItem.fromJson(item as Map<String, dynamic>))
            .toList();
        return data;
      } else {
        throw Exception("Unexpected data format");
      }
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
