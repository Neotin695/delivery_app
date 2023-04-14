import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetCheckerService {
  Future<bool> isConnected() async {
    var isDeviceConnected =
        Connectivity().checkConnectivity() != ConnectivityResult.none &&
            await InternetConnectionChecker().hasConnection;

    var subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
      }
    });

    return isDeviceConnected;
  }
}
