import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/entity_response.dart';
import 'package:flutter/material.dart';

class SchemesProvider extends BaseProvider {
  factory SchemesProvider() => _instance ?? SchemesProvider._internal();

  static SchemesProvider? _instance;

  SchemesProvider._internal() {
    _instance = this;
  }

  List<EntityResponse?> schemeListResponse = [];

  Future<void> callGetSchemesList() async {
    isLoading.value = schemeListResponse.isEmpty;
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
