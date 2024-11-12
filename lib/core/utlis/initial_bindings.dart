import 'package:Octanet/core/app_export.dart';
import 'package:Octanet/data/api_client/api_client.dart';
import 'package:Octanet/core/utlis/pref_utils.dart';

/// A class for setting up initial dependencies using GetX dependency injection.
///
/// This class extends the [Bindings] class and overrides the [dependencies]
/// method to register dependencies using GetX's [Get.put] method.
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
