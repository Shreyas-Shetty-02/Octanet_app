// ignore: depend_on_referenced_packages
import 'package:connectivity_plus/connectivity_plus.dart';

/// For checking internet connectivity
abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  NetworkInfo(this.connectivity);

  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    // ignore: unrelated_type_equality_checks
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  @override
  Future<ConnectivityResult> get connectivityResult =>
      throw UnimplementedError();

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      throw UnimplementedError();
}
