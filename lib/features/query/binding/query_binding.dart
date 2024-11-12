import 'package:Octanet/features/query/controller/query_link_controller.dart';
import 'package:get/get.dart';
import 'package:Octanet/features/query/controller/query_controller.dart';

class QueryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QueryController());
    Get.lazyPut(() => QueryLinkController());
  }
}
