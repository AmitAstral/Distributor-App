import 'package:distributor_empower/model/base/base_model.dart';

class BaseResponse<T extends BaseModel?> {
  List<T?>? dataList;

  String? dataStr;

  String? message;

  String? statusCode;

  bool? isSuccess = false;

  dynamic actualData;

  T? get getData => dataList?.firstOrNull;

  get getIsSuccess => isSuccess ?? false;

  BaseResponse({
    this.message,
    this.statusCode,
    this.isSuccess,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json, BaseModel? baseModel) {
    final baseResponse = BaseResponse<T>(
      isSuccess: json['result'] as bool? ?? false,
      message: json['responseMessage'] as String?,
      statusCode: json['statusCode'] as String?,
    );
    final rawData = json['data'];
    if (baseModel != null) {
      if (rawData is List) {
        baseResponse.dataList = List.from(rawData.map((x) => (baseModel.fromJson(x) as T?)));
      } else if (rawData is Map<String, dynamic>) {
        baseResponse.dataList = [baseModel.fromJson(rawData) as T?];
      }
    } else if (rawData is String) {
      baseResponse.dataStr = rawData;
    } else {
      baseResponse.actualData = rawData;
    }
    return baseResponse;
  }
}
