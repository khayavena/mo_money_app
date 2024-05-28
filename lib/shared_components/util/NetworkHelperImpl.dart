import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';
import 'package:mo_money_app/env/env_config.dart';

import 'NetworkHelper.dart';

@Injectable(as: NetworkHelper)
class NetworkHelperImpl implements NetworkHelper {
  @override
  Future<bool> isNetworkConnected() async {
    return EnvConfig.live;
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.wifi;


  }
}
