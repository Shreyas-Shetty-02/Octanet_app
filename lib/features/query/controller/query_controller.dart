import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/core/base/base_model.dart';
import 'package:Octanet/core/utlis/logger.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/features/query/models/query_model.dart';
import 'package:Octanet/features/query/service/query_service.dart';

class QueryController extends GetxController {
  RxList<QueryResponse> queryData = <QueryResponse>[].obs;
  RxBool isLoading = false.obs;
  RxBool isSubmitting = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchQueryData();
  }

  Future<void> fetchQueryData() async {
    isLoading.value = true;
    try {
      List<QueryResponse> data = await QueryService().getQueryData();
      queryData.assignAll(data);
      isLoading.value = false;
    } catch (error) {
      Logger.log(error);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> submitQueryData(BaseModel requestData) async {
    try {
      final response =
          await Get.find<ApiClient>().postRequest('api/query/', requestData);
      if (response.status == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
