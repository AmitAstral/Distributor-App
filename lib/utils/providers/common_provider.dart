import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/provider/base_provider.dart';

class CommonProvider extends BaseProvider {
  Future<dynamic> checkServerStatus() async {
    final response = await apiRep.checkServerStatus(onApiError);
    return response['result'];
  }

  Future<dynamic> getAllSetting() async {
    final response = await apiRep.getAllSetting();
    return response['result'];
  }
}
