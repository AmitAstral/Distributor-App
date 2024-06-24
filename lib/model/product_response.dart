import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/model/base/base_model.dart';

class ProductResponse extends BaseModel {
  ProductResponse({
    this.id,
    this.itemId,
    this.name,
    this.imgUrl,
    this.weight,
    this.unit,
    this.dp,
    this.cartonQty,
  });

  @override
  ProductResponse fromJson(json) {
    return ProductResponse(
      id: json['Id'],
      itemId: json['ItemId'],
      name: json['Name'],
      imgUrl: json['Img_url'],
      weight: json['weight'],
      unit: json['Unit'],
      dp: json['DP'],
      cartonQty: json['CartonQty'],
    );
  }

  String? id;
  String? itemId;
  String? name;
  String? imgUrl;
  String? weight;
  String? unit;
  String? dp;
  String? cartonQty;
  bool isFav = true;

  String get getTotalPrice =>
      '${storage.settingsData.currencySymbol} ${((double.tryParse(dp ?? '0') ?? 0) * (double.tryParse(cartonQty ?? '0') ?? 0)).toStringAsFixed(2)}';

  String get getRequireAction => (isFav) ? 'ADD' : 'DELETE';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['ItemId'] = itemId;
    map['Name'] = name;
    map['Img_url'] = imgUrl;
    map['weight'] = weight;
    map['Unit'] = unit;
    map['DP'] = dp;
    map['CartonQty'] = cartonQty;
    return map;
  }
}
