import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

import 'NetworkHelper.dart';

@Injectable(as: NetworkHelper)
class NetworkHelperImpl implements NetworkHelper {
  @override
  Future<bool> isNetworkConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.wifi;

    // if (connectivityResult == ConnectivityResult.mobile) {
    //   return true;
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   return true;
    // }
    // return false;
  }
}
