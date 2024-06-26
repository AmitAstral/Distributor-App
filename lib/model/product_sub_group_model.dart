import 'package:distributor_empower/model/base/base_model.dart';

class ProductSubGroupModel extends BaseModel {
  ProductSubGroupModel({
    this.id,
    this.description,
    this.productGroupId,
    this.imgUrl,
    this.maxiWeight,
    this.miniWeight,
    this.orderby,
    this.unitDesc,
  });

  ProductSubGroupModel fromJson(json) {
    return ProductSubGroupModel(
      id: json['Id'],
      description: json['Description'],
      productGroupId: json['ProductGroup_Id'],
      imgUrl: json['Img_url'],
      maxiWeight: json['maxi_weight'],
      miniWeight: json['mini_weight'],
      orderby: json['orderby'],
      unitDesc: json['Unit_Desc'],
    );
  }

  String? id;
  String? description;
  String? productGroupId;
  String? imgUrl;
  String? maxiWeight;
  String? miniWeight;
  String? orderby;
  String? unitDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Description'] = description;
    map['ProductGroup_Id'] = productGroupId;
    map['Img_url'] = imgUrl;
    map['maxi_weight'] = maxiWeight;
    map['mini_weight'] = miniWeight;
    map['orderby'] = orderby;
    map['Unit_Desc'] = unitDesc;
    return map;
  }
}
