import 'package:distributor_empower/model/base/base_model.dart';

class SendOtpModel extends BaseModel {
  SendOtpModel({
    this.otp,
    this.message,
  });

  @override
  SendOtpModel fromJson(json) {
    return SendOtpModel(
      otp: json['OTP'],
      message: json['Message'],
    );
  }

  String? otp;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OTP'] = otp;
    map['Message'] = message;
    return map;
  }
}
