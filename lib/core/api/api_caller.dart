import 'dart:io';

import 'package:dio/dio.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/base/base_model.dart';
import 'package:distributor_empower/model/base/base_response.dart';
import 'package:flutter/cupertino.dart';

mixin class ApiCaller {
  Future<BaseResponse<T?>> executeApiCall<T extends BaseModel>({
    required Future<Response> apiCall,
    Function(String)? onApiError,
    BaseModel? baseModel,
  }) async {
    try {
      var data = (await apiCall).data;
      final baseResponse = BaseResponse<T>.fromJson(data, baseModel);

      if (baseResponse.isSuccess ?? false) {
        return baseResponse;
      } else {
        if (onApiError != null) onApiError(baseResponse.message ?? '');
      }
    } catch (e) {
      _handleApiError(e, onApiError);
    }
    return BaseResponse<T?>(
      isSuccess: false,
      statusCode: '500',
      message: AppLocalizations.current.somethingWentWrong,
    );
  }

  void _handleApiError(e, Function(String)? onApiError) {
    var message = AppLocalizations.current.somethingWentWrong;
    if (e is DioException) {
      if (e.error != null) {
        message = (e.error).toString();
      } else {
        message = e.response?.data['error'];
      }
    } else if (e is HttpException) {
      message = e.message;
    }
    debugPrint(e.toString());
    if (onApiError != null) onApiError(message);
  }
}
