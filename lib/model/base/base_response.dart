import 'package:distributor_empower/model/base/base_model.dart';

class BaseResponse<T extends BaseModel?> {
  T? data;

  String? message;

  String? statusCode;

  bool isSuccess = false;

  /*BaseResponse({required this.isSuccess, required T baseModel, Map<String, dynamic>? json, this.message, this.statusCode}) {
    data = baseModel?.fromJson(json ?? {}) as T?;
  }*/

  BaseResponse({
    required this.message,
    required this.statusCode,
    required this.isSuccess,
    required Map<String, dynamic>? dataJson,
    required BaseModel? baseModel,
  }) {
    data = baseModel?.fromJson(dataJson ?? {}) as T?;
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json, T? baseModel) {
    return BaseResponse(
      isSuccess: json['isSuccess'] as bool? ?? false,
      baseModel: baseModel,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as String?,
      dataJson: json['data'],
    );
  }
}
