import 'dart:io';

import 'package:dio/dio.dart';
import 'package:distributor_empower/model/base/base_model.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:flutter/cupertino.dart';

mixin class ApiCaller {
  Future<T?> executeApiCall<T>({
    required Future<Response> apiCall,
    Function(String)? onApiError,
    bool isShowErrorMessage = true,
    BaseModel? baseModel,
  }) async {
    hideKeyboard();
    try {
      var data = (await apiCall).data;
      if (data['statusCode'] == '200') {
        if (baseModel == null) {
          return data;
        } else {
          if (data['data'] is List && (data['data'] as List).isNotEmpty) {
            return baseModel.fromJson(data['data'][0]) as T?;
          } else {
            return baseModel.fromJson(data['data']) as T?;
          }
        }
      } else {
        if (onApiError != null) onApiError(data['responseMessage']);
        return null;
      }
    } catch (e) {
      _handleApiError(e, onApiError);
    }
    return null;
  }

  Future<List<T?>?> executeApiCallForList<T>({
    required Future<Response> apiCall,
    Function(String)? onApiError,
    bool isShowErrorMessage = true,
    BaseModel? baseModel,
  }) async {
    hideKeyboard();
    try {
      var data = (await apiCall).data;
      return (baseModel == null) ? data : _convertDataToList<T>(data, baseModel);
    } catch (e) {
      _handleApiError(e, onApiError);
    }
    return null;
  }

  List<T?>? _convertDataToList<T>(Map<String, dynamic> data, BaseModel? baseModel) {
    if (data['data'] is List) {
      final list = <T?>[];
      for (Map<String, dynamic> i in data['data']) {
        list.add(baseModel?.fromJson(i) as T?);
      }
      return list;
    }
    return null;
  }

  void _handleApiError(e, Function(String)? onApiError) {
    var message = 'Something went wrong';
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
