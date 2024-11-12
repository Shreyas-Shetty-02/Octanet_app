import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/features/query/models/query_links_model.dart';
import 'package:Octanet/features/query/service/query_link_service.dart';

class QueryLinkController extends GetxController {
  RxList<QueryLinks> queryLinkData = <QueryLinks>[].obs;
  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchQueryLinkData();
  }

  Future<void> fetchQueryLinkData() async {
    isLoading.value = true;
    try {
      List<QueryLinks> data = await QueryLinkService().getQueryLinkData();
      queryLinkData.assignAll(data);
    } catch (error) {
      Logger.log(error);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
