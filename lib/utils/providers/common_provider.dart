import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/provider/base_provider.dart';

class CommonProvider extends BaseProvider {
  Future<bool> checkServerStatus() async {
    final response = await apiRep.checkServerStatus(onApiError);
    return response.isSuccess ?? false;
  }

  Future<bool> getAllSetting() async {
    final response = await apiRep.getAllSetting();
    return response.isSuccess ?? false;
  }
}
