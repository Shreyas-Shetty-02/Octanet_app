import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/query/models/query_model.dart';

class QueryService {
  Future<List<QueryResponse>> getQueryData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>()
          .getRequest<QueryResponse>("api/query/", isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      var data = (response.data as List)
          .map((item) => QueryResponse.fromJson(item as Map<String, dynamic>))
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
