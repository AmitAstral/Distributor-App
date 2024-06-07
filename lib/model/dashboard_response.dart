import 'package:distributor_empower/model/base/base_model.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:flutter/material.dart';

class DashboardResponse extends BaseModel {
  DashboardResponse({
    this.sales,
    this.creditDetails,
    this.orderDetails,
    this.focusProduct,
    this.creditAging,
  });

  List<Sales>? sales;
  CreditDetails? creditDetails;
  OrderDetails? orderDetails;
  List<FocusProduct>? focusProduct;
  List<CreditAging>? creditAging;
  String? salesTitle;
  String? creditDetailsTitle;
  String? orderDetailsTitle;
  String? focusDetailsTitle;
  String? creditAgeingTitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (sales != null) {
      map['Sales'] = sales?.map((v) => v.toJson()).toList();
    }
    if (creditDetails != null) {
      map['CreditDetails'] = creditDetails?.toJson();
    }
    if (orderDetails != null) {
      map['OrderDetails'] = orderDetails?.toJson();
    }
    if (focusProduct != null) {
      map['FocusProduct'] = focusProduct?.map((v) => v.toJson()).toList();
    }
    if (creditAging != null) {
      map['CreditAging'] = creditAging?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  DashboardResponse fromJson(Map<String, dynamic> json) {
    if (json['Sales'] != null) {
      sales = [];
      json['Sales'].forEach((v) {
        sales?.add(Sales.fromJson(v));
      });
    }
    creditDetails = json['CreditDetails'] != null ? CreditDetails.fromJson(json['CreditDetails']) : null;
    orderDetails = json['OrderDetails'] != null ? OrderDetails.fromJson(json['OrderDetails']) : null;
    if (json['FocusProduct'] != null) {
      focusProduct = [];
      json['FocusProduct'].forEach((v) {
        focusProduct?.add(FocusProduct.fromJson(v));
      });
    }
    if (json['CreditAging'] != null) {
      creditAging = [];
      json['CreditAging'].forEach((v) {
        creditAging?.add(CreditAging.fromJson(v));
      });
    }

    salesTitle = json['SalesTitle'] ?? '';
    creditDetailsTitle = json['CreditDetailTitle'] ?? '';
    orderDetailsTitle = json['OrderDetailTitle'] ?? '';
    focusDetailsTitle = json['FocusProductTitle'] ?? '';
    creditAgeingTitle = json['CreditAgingTitle'] ?? '';
    return this;
  }
}

class CreditAging {
  CreditAging({
    this.label,
    this.value,
  });

  CreditAging.fromJson(dynamic json) {
    label = json['Label'];
    value = json['Value'];
  }

  String? label;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Label'] = label;
    map['Value'] = value;
    return map;
  }
}

class FocusProduct {
  FocusProduct({
    this.id,
    this.title,
    this.rate,
    this.productImage,
    this.gst,
    this.sapcode,
    this.unit,
    this.packSize,
    this.cartonQty,
  });

  FocusProduct.fromJson(dynamic json) {
    id = json['Id'];
    title = json['Title'];
    rate = json['Rate'];
    productImage = json['ProductImage'];
    gst = json['Gst'];
    sapcode = json['sapcode'];
    unit = json['unit'];
    packSize = json['pack_size'];
    cartonQty = json['CartonQty'];
  }

  String? id;
  String? title;
  String? rate;
  String? productImage;
  String? gst;
  String? sapcode;
  String? unit;
  String? packSize;
  String? cartonQty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Title'] = title;
    map['Rate'] = rate;
    map['ProductImage'] = productImage;
    map['Gst'] = gst;
    map['sapcode'] = sapcode;
    map['unit'] = unit;
    map['pack_size'] = packSize;
    map['CartonQty'] = cartonQty;
    return map;
  }
}

class OrderDetails {
  OrderDetails({
    this.totalOrder,
    this.dispatchedOrder,
    this.authorizedPendingOrder,
    this.unAuthorizedPendingOrder,
    this.percentageDispatched = 0,
    this.percentageAuthorizedPending = 0,
    this.percentageUnAuthorizedPending = 0,
    this.colorDispatched,
    this.colorAuthorizedPending,
    this.colorUnAuthorizedPending,
  });

  OrderDetails.fromJson(dynamic json) {
    totalOrder = json['TotalOrder'];
    dispatchedOrder = json['DispatchedOrder'];
    authorizedPendingOrder = json['AuthorizedPendingOrder'];
    unAuthorizedPendingOrder = json['UnAuthorizedPendingOrder'];
    percentageDispatched = double.tryParse(json['PercentageDispatched'] ?? '0') ?? 0;
    percentageAuthorizedPending = double.tryParse(json['PercentageAuthorizedPending'] ?? '0') ?? 0;
    percentageUnAuthorizedPending = double.tryParse(json['PercentageUnAuthorizedPending'] ?? '0') ?? 0;
    colorDispatched = json['ColorDispatched'].toString().getColorFromColorString;
    colorAuthorizedPending = json['ColorAuthorizedPending'].toString().getColorFromColorString;
    colorUnAuthorizedPending = json['ColorUnAuthorizedPending'].toString().getColorFromColorString;
  }

  String? totalOrder;
  String? dispatchedOrder;
  String? authorizedPendingOrder;
  String? unAuthorizedPendingOrder;
  double percentageDispatched = 0;
  double percentageAuthorizedPending = 0;
  double percentageUnAuthorizedPending = 0;
  Color? colorDispatched;
  Color? colorAuthorizedPending;
  Color? colorUnAuthorizedPending;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TotalOrder'] = totalOrder;
    map['DispatchedOrder'] = dispatchedOrder;
    map['AuthorizedPendingOrder'] = authorizedPendingOrder;
    map['UnAuthorizedPendingOrder'] = unAuthorizedPendingOrder;
    map['PercentageDispatched'] = percentageDispatched;
    map['PercentageAuthorizedPending'] = percentageAuthorizedPending;
    map['PercentageUnAuthorizedPending'] = percentageUnAuthorizedPending;
    map['ColorDispatched'] = colorDispatched;
    map['ColorAuthorizedPending'] = colorAuthorizedPending;
    map['ColorUnAuthorizedPending'] = colorUnAuthorizedPending;
    return map;
  }
}

class CreditDetails {
  CreditDetails({
    this.creditLimit,
    this.usedCredit,
    this.remainingCredit,
    this.remainingPercentage,
  });

  CreditDetails.fromJson(dynamic json) {
    creditLimit = json['CreditLimit'];
    usedCredit = json['UsedCredit'];
    remainingCredit = json['RemainingCredit'];
    remainingPercentage = double.tryParse(json['RemainingPercentage'] ?? '0') ?? 0;
  }

  String? creditLimit;
  String? usedCredit;
  String? remainingCredit;
  double? remainingPercentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CreditLimit'] = creditLimit;
    map['UsedCredit'] = usedCredit;
    map['RemainingCredit'] = remainingCredit;
    map['RemainingPercentage'] = remainingPercentage;
    return map;
  }
}

class Sales {
  Sales({
    this.monthNumber,
    this.monthName,
    this.netTotalSales,
  });

  Sales.fromJson(dynamic json) {
    monthNumber = json['MonthNumber'] ?? '';
    monthName = json['MonthName'] ?? '';
    netTotalSales = double.tryParse(json['Net_Total_Sales']) ?? 0;
  }

  String? monthNumber;
  String? monthName;
  double? netTotalSales;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MonthNumber'] = monthNumber;
    map['MonthName'] = monthName;
    map['Net_Total_Sales'] = netTotalSales;
    return map;
  }
}
