import 'package:distributor_empower/model/base/base_model.dart';

class SalesReportDetailsResponse extends BaseModel {
  SalesReportDetailsResponse({
    this.distributorName,
    this.distributorMobile,
    this.distributorAddress,
    this.invoiceNo,
    this.invoiceDate,
    this.totalAmount,
    this.totalAmountDisplay,
    this.invoiceItemList,
  });

  @override
  SalesReportDetailsResponse fromJson(json) {
    distributorName = json['DistributorName'];
    distributorMobile = json['DistributorMobile'];
    distributorAddress = json['DistributorAddress'];
    invoiceNo = json['InvoiceNo'];
    invoiceDate = json['InvoiceDate'];
    totalAmount = json['TotalAmount'];
    totalAmountDisplay = json['TotalAmountDisplay'];
    if (json['InvoiceItem_List'] != null) {
      invoiceItemList = [];
      json['InvoiceItem_List'].forEach((v) {
        invoiceItemList?.add(InvoiceItemList.fromJson(v));
      });
    }
    return this;
  }

  String? distributorName;
  String? distributorMobile;
  String? distributorAddress;
  String? invoiceNo;
  String? invoiceDate;
  String? totalAmount;
  String? totalAmountDisplay;
  List<InvoiceItemList>? invoiceItemList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DistributorName'] = distributorName;
    map['DistributorMobile'] = distributorMobile;
    map['DistributorAddress'] = distributorAddress;
    map['InvoiceNo'] = invoiceNo;
    map['InvoiceDate'] = invoiceDate;
    map['TotalAmount'] = totalAmount;
    map['TotalAmountDisplay'] = totalAmountDisplay;
    if (invoiceItemList != null) {
      map['InvoiceItem_List'] = invoiceItemList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class InvoiceItemList {
  InvoiceItemList({
    this.invoiceDetialId,
    this.productId,
    this.productName,
    this.unit,
    this.qty,
    this.price,
    this.amount,
  });

  InvoiceItemList.fromJson(json) {
    invoiceDetialId = json['invoiceDetial_id'];
    productId = json['Product_id'];
    productName = json['Product_name'];
    unit = json['unit'];
    qty = json['qty'];
    price = json['price'];
    amount = json['Amount'];
  }

  String? invoiceDetialId;
  String? productId;
  String? productName;
  String? unit;
  String? qty;
  String? price;
  String? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['invoiceDetial_id'] = invoiceDetialId;
    map['Product_id'] = productId;
    map['Product_name'] = productName;
    map['unit'] = unit;
    map['qty'] = qty;
    map['price'] = price;
    map['Amount'] = amount;
    return map;
  }
}
