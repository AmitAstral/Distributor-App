import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/statement_response.dart';
import 'package:flutter/cupertino.dart';

class StatementProvider extends BaseProvider {
  List<StatementResponse?> accountStatementList = [];

  Future<void> callStatementOfAccountAPI(String? fromDate, String? toDate) async {
    isLoading.value = true;
    try {
      final request = ApiReqData(fromDate: fromDate, toDate: toDate, withUserInfo: true);
      final response = await apiRep.callStatementOfAccountAPI(request, onApiError);
      accountStatementList = response.dataList ?? [];
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
    }
  }
}
