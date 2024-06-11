import 'dart:ui';

import 'package:distributor_empower/model/base/base_model.dart';
import 'package:distributor_empower/utils/extensions.dart';

class DashboardResponse extends BaseModel {
  String? title;
  String? viewType;
  dynamic data;

  DashboardResponse({
    this.title,
    this.viewType,
    this.data,
  });

  List<Sales> get sales {
    try {
      return data ?? [];
    } catch (e) {
      return [];
    }
  }

  CreditDetails get creditDetails {
    try {
      return data ?? CreditDetails();
    } catch (e) {
      return CreditDetails();
    }
  }

  List<OrderDetail> get orderDetail {
    try {
      return data ?? [];
    } catch (e) {
      return [];
    }
  }

  List<FocusProduct> get focusProduct {
    try {
      return data ?? [];
    } catch (e) {
      return [];
    }
  }

  CreditAgingData get creditAging {
    try {
      return data ?? CreditAgingData();
    } catch (e) {
      return CreditAgingData();
    }
  }

  DashboardViewType get getViewType {
    try {
      return DashboardViewType.values.byName((viewType ?? 'none'));
    } catch (e) {
      return DashboardViewType.none;
    }
  }

  @override
  DashboardResponse fromJson(Map<String, dynamic> json) {
    final obj = DashboardResponse(
      title: json['Title'],
      viewType: json['ViewType'] ?? '',
    );

    final data = json['Data'];

    switch (obj.getViewType) {
      case DashboardViewType.sales:
        obj.data = List<Sales>.from(data.map((x) => Sales.fromJson(x)));
      case DashboardViewType.creditDetails:
        obj.data = CreditDetails.fromJson(data);
      case DashboardViewType.orderDetails:
        obj.data = List<OrderDetail>.from(data.map((x) => OrderDetail.fromJson(x)));
      case DashboardViewType.focusProduct:
        obj.data = List<FocusProduct>.from(data.map((x) => FocusProduct.fromJson(x)));
      case DashboardViewType.creditAging:
        obj.data = CreditAgingData.fromJson(data);
      default:
        obj.data = data;
    }
    return obj;
  }
}

enum DashboardViewType {
  sales,
  creditDetails,
  orderDetails,
  focusProduct,
  creditAging,
  none;
}

class Sales {
  String year;
  String monthNumber;
  String monthName;
  double netTotalSales;

  Sales({
    required this.year,
    required this.monthNumber,
    required this.monthName,
    required this.netTotalSales,
  });

  factory Sales.fromJson(Map<String, dynamic> json) {
    return Sales(
      year: json['Year'],
      monthNumber: json['MonthNumber'],
      monthName: json['MonthName'],
      netTotalSales: double.tryParse(json['Net_Total_Sales'] ?? '0') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Year': year,
      'MonthNumber': monthNumber,
      'MonthName': monthName,
      'Net_Total_Sales': netTotalSales,
    };
  }
}

class CreditDetails {
  String? remainingCredit;
  double? remainingPercentage;
  List<Tile>? tiles;

  CreditDetails({
    this.remainingCredit,
    this.remainingPercentage,
    this.tiles,
  });

  factory CreditDetails.fromJson(Map<String, dynamic> json) {
    return CreditDetails(
      remainingCredit: json['RemainingCredit'],
      remainingPercentage: double.tryParse(json['RemainingPercentage'] ?? '0') ?? 0,
      tiles: List<Tile>.from(json['tiles'].map((x) => Tile.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RemainingCredit': remainingCredit,
      'RemainingPercentage': remainingPercentage,
      /*'tiles': List<dynamic>.from(tiles?.map((x) => x.toJson())),*/
    };
  }
}

class Tile {
  String label;
  String value;

  Tile({
    required this.label,
    required this.value,
  });

  factory Tile.fromJson(Map<String, dynamic> json) {
    return Tile(
      label: json['Label'],
      value: json['Value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Label': label,
      'Value': value,
    };
  }
}

class OrderDetail {
  String? label;
  String? value;
  double? percentageValue;
  Color? colorCode;

  OrderDetail({
    this.label,
    this.value,
    this.percentageValue,
    this.colorCode,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      label: json['Label'],
      value: json['Value'],
      percentageValue: double.tryParse(json['PercentageValue'] ?? '0') ?? 0,
      colorCode: (json['ColorCode'] ?? '').toString().getColorFromColorString,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Label': label,
      'Value': value,
      'PercentageValue': percentageValue,
      'ColorCode': colorCode,
    };
  }
}

class FocusProduct {
  String id;
  String title;
  String rate;
  String productImage;
  String gst;
  String sapcode;
  String unit;
  String packSize;
  String cartonQty;

  FocusProduct({
    required this.id,
    required this.title,
    required this.rate,
    required this.productImage,
    required this.gst,
    required this.sapcode,
    required this.unit,
    required this.packSize,
    required this.cartonQty,
  });

  factory FocusProduct.fromJson(Map<String, dynamic> json) {
    return FocusProduct(
      id: json['Id'],
      title: json['Title'],
      rate: json['Rate'],
      productImage: json['ProductImage'],
      gst: json['Gst'],
      sapcode: json['sapcode'],
      unit: json['unit'],
      packSize: json['pack_size'],
      cartonQty: json['CartonQty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Title': title,
      'Rate': rate,
      'ProductImage': productImage,
      'Gst': gst,
      'sapcode': sapcode,
      'unit': unit,
      'pack_size': packSize,
      'CartonQty': cartonQty,
    };
  }
}

class CreditAgingData {
  String? amountLabel;
  List<CreditAging>? list;

  CreditAgingData({this.amountLabel, this.list});

  factory CreditAgingData.fromJson(Map<String, dynamic> json) {
    return CreditAgingData(
      amountLabel: json['GraphLabel'],
      list: List<CreditAging>.from(json['tiles'].map((x) => CreditAging.fromJson(x))),
    );
  }
}

class CreditAging {
  String label;
  String value;

  CreditAging({
    required this.label,
    required this.value,
  });

  factory CreditAging.fromJson(Map<String, dynamic> json) {
    return CreditAging(
      label: json['Label'],
      value: json['Value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Label': label,
      'Value': value,
    };
  }
}
