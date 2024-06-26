import 'package:distributor_empower/model/base/base_model.dart';

class ProductGroupModel extends BaseModel {
  ProductGroupModel({
    this.id,
    this.description,
    this.imgUrl,
    this.categoryId,
  });

  ProductGroupModel fromJson(json) {
    return ProductGroupModel(
      id: json['Id'],
      description: json['Description'],
      imgUrl: json['Img_url'],
      categoryId: json['Category_Id'],
    );
  }

  String? id;
  String? description;
  String? imgUrl;
  String? categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Description'] = description;
    map['Img_url'] = imgUrl;
    map['Category_Id'] = categoryId;
    return map;
  }
}
