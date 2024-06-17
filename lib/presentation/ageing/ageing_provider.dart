import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/ageing_response.dart';
import 'package:flutter/material.dart';

class AgeingProvider extends BaseProvider {
  AgeingResponse? ageingDetailsResponse;

  Future<void> callAgeingReport() async {
    isLoading.value = true;
    try {
      final response = await apiRep.callAgeingReport(onApiError);
      ageingDetailsResponse = response.getData;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
    }
  }
}
