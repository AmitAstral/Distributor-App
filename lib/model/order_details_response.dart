import 'package:distributor_empower/model/base/base_model.dart';

class OrderDetailsResponse extends BaseModel {
  OrderDetailsResponse({
    this.orderDetails,
    this.amount,
    this.taxAmount,
    this.netAmount,
  });

  @override
  OrderDetailsResponse fromJson(dynamic json) {
    if (json['orderDetails'] != null) {
      orderDetails = [];
      json['orderDetails'].forEach((v) {
        orderDetails?.add(OrderDetails.fromJson(v));
      });
    }
    amount = json['Amount'];
    taxAmount = json['TaxAmount'];
    netAmount = json['NetAmount'];
    return this;
  }

  List<OrderDetails>? orderDetails;
  String? amount;
  String? taxAmount;
  String? netAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orderDetails != null) {
      map['orderDetails'] = orderDetails?.map((v) => v.toJson()).toList();
    }
    map['Amount'] = amount;
    map['TaxAmount'] = taxAmount;
    map['NetAmount'] = netAmount;
    return map;
  }
}

class OrderDetails {
  OrderDetails({
    this.id,
    this.itemId,
    this.itemName,
    this.weight,
    this.rate,
    this.qty,
    this.amount,
    this.taxAmount,
    this.netAmount,
  });

  OrderDetails.fromJson(dynamic json) {
    id = json['Id'];
    itemId = json['Item_Id'];
    itemName = json['Item_Name'];
    weight = json['Weight'];
    rate = json['Rate'];
    qty = json['Qty'];
    amount = json['Amount'];
    taxAmount = json['TaxAmount'];
    netAmount = json['NetAmount'];
  }

  String? id;
  String? itemId;
  String? itemName;
  String? weight;
  String? rate;
  String? qty;
  String? amount;
  String? taxAmount;
  String? netAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Item_Id'] = itemId;
    map['Item_Name'] = itemName;
    map['Weight'] = weight;
    map['Rate'] = rate;
    map['Qty'] = qty;
    map['Amount'] = amount;
    map['TaxAmount'] = taxAmount;
    map['NetAmount'] = netAmount;
    return map;
  }
}
