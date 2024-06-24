import 'package:distributor_empower/model/base/base_model.dart';

class PendingOrderResponse extends BaseModel {
  PendingOrderResponse({
    this.orderNo,
    this.orderDate,
    this.orderAmount,
    this.status,
  });

  @override
  PendingOrderResponse fromJson(json) {
    return PendingOrderResponse(
      orderNo: json['OrderNo'],
      orderDate: json['OrderDate'],
      orderAmount: json['OrderAmount'],
      status: json['Status'],
    );
  }

  String? orderNo;
  String? orderDate;
  String? orderAmount;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OrderNo'] = orderNo;
    map['OrderDate'] = orderDate;
    map['OrderAmount'] = orderAmount;
    map['Status'] = status;
    return map;
  }
}
