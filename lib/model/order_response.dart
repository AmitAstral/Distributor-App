import 'package:distributor_empower/model/base/base_model.dart';

class OrderResponse extends BaseModel {
  OrderResponse({
    this.date,
    this.orderNo,
    this.orderAmount,
    this.totalSKU,
    this.isRetailerAppOrder,
    this.supplyAmount,
    this.distName,
    this.orderFrom,
  });

  @override
  OrderResponse fromJson(json) {
    return OrderResponse(
      date: json['Date'],
      orderNo: json['Order_No'],
      orderAmount: json['OrderAmount'],
      totalSKU: json['TotalSKU'],
      isRetailerAppOrder: json['Is_Retailer_App_order'],
      supplyAmount: json['Supply_Amount'],
      distName: json['Dist_Name'],
      orderFrom: json['OrderFrom'],
    );
  }

  String? date;
  String? orderNo;
  String? orderAmount;
  String? totalSKU;
  String? isRetailerAppOrder;
  String? supplyAmount;
  String? distName;
  String? orderFrom;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Date'] = date;
    map['Order_No'] = orderNo;
    map['OrderAmount'] = orderAmount;
    map['TotalSKU'] = totalSKU;
    map['Is_Retailer_App_order'] = isRetailerAppOrder;
    map['Supply_Amount'] = supplyAmount;
    map['Dist_Name'] = distName;
    map['OrderFrom'] = orderFrom;
    return map;
  }
}
