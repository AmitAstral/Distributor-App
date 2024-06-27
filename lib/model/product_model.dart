import 'package:distributor_empower/model/base/base_model.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:flutter/cupertino.dart';

class ProductModel extends BaseModel {
  ProductModel({
    this.id,
    this.sAPCode,
    this.description,
    this.unit,
    this.dp,
    this.dPPerPCS,
    this.cartonNo,
    this.weightVal,
    this.weight,
    this.oRGweight,
    this.imgUrl,
    this.isFavorite,
    this.isAddInCart,
    this.itemId,
    this.sapCode,
    this.qtyStr,
  }) {
    qty.value = qtyStr.tryParseToNum.toInt();
    textController.text = qty.value.toString();
  }

  @override
  ProductModel fromJson(json) {
    return ProductModel(
      id: json['Id'],
      itemId: json['Item_Id'],
      sAPCode: json['SAPCode'],
      description: json['Description'] ?? json['Item_Name'],
      unit: json['unit'],
      dp: json['DP'],
      dPPerPCS: json['DPPerPCS'],
      cartonNo: json['Carton_No'],
      weightVal: json['weightVal'],
      weight: json['weight'],
      oRGweight: json['ORGweight'],
      imgUrl: json['Img_url'],
      isFavorite: json['is_Favorite'],
      isAddInCart: json['is_Add_In_Cart'],
      sapCode: json['SAPCode'],
      qtyStr: json['Qty'],
    );
  }

  String? id;
  String? sAPCode;
  String? description;
  String? unit;
  String? itemId;
  String? dp;
  String? dPPerPCS;
  String? cartonNo;
  String? weightVal;
  String? weight;
  String? oRGweight;
  String? imgUrl;
  String? isFavorite;
  String? isAddInCart;
  String? sapCode;
  String? qtyStr;
  ValueNotifier<int> qty = ValueNotifier(0);

  final textController = TextEditingController();

  bool get getIsFav => isFavorite == '1';

  String get getNetAmountWithCurrency => getNetAmount.toStringAsFixed(2).formatWithCurrency;

  num get getNetAmount => (qty.value * (dp.tryParseToNum));

  String get getRequireAction => getIsFav ? 'ADD' : 'DELETE';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['SAPCode'] = sAPCode;
    map['Description'] = description;
    map['unit'] = unit;
    map['DP'] = dp;
    map['DPPerPCS'] = dPPerPCS;
    map['Carton_No'] = cartonNo;
    map['weightVal'] = weightVal;
    map['weight'] = weight;
    map['ORGweight'] = oRGweight;
    map['Img_url'] = imgUrl;
    map['is_Favorite'] = isFavorite;
    map['is_Add_In_Cart'] = isAddInCart;
    map['SAPCode'] = sapCode;
    map['Qty'] = qtyStr;
    return map;
  }
}
