import 'package:distributor_empower/model/base/base_model.dart';

class ProductDetailsResponse extends BaseModel {
  ProductDetailsResponse({
    this.id,
    this.itemId,
    this.unit,
    this.orderQty,
    this.pendingQty,
    this.pendingAmt,
    this.status,
    this.orderDate,
  });

  @override
  ProductDetailsResponse fromJson(json) {
    return ProductDetailsResponse(
      id: json['Id'],
      itemId: json['Item_Id'],
      unit: json['Unit'],
      orderQty: json['orderQty'],
      pendingQty: json['PendingQty'],
      pendingAmt: json['PendingAmt'],
      status: json['Status'],
      orderDate: json['OrderDate'],
    );
  }

  String? id;
  String? itemId;
  String? unit;
  String? orderQty;
  String? pendingQty;
  String? pendingAmt;
  String? status;
  String? orderDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Item_Id'] = itemId;
    map['Unit'] = unit;
    map['orderQty'] = orderQty;
    map['PendingQty'] = pendingQty;
    map['PendingAmt'] = pendingAmt;
    map['Status'] = status;
    map['OrderDate'] = orderDate;
    return map;
  }
}
