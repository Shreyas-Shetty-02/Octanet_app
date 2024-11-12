import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/core/utlis/progress_dialog_utils.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/query/models/query_links_model.dart';

class QueryLinkService {
  Future<List<QueryLinks>> getQueryLinkData() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      var response = await Get.find<ApiClient>().getRequest<List<QueryLinks>>(
          "api/query-links/?page_size=0/",
          isAuth: true);
      ProgressDialogUtils.hideProgressDialog();
      if (response.data is List) {
        var data = (response.data as List)
            .map((item) => QueryLinks.fromJson(item as Map<String, dynamic>))
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
