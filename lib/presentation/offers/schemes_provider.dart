import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/entity_response.dart';
import 'package:flutter/material.dart';

class SchemesProvider extends BaseProvider {
  List<EntityResponse?> schemeListResponse = [];

  Future<void> callGetSchemesList({bool isProgress = true}) async {
    isLoading.value = isProgress;
    try {
      final request = ApiReqData(
        entityType: 'schemes',
      );
      final response = await apiRep.callGetEntityListAPI(request, onApiError);
      schemeListResponse = response.dataList ?? [];
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
