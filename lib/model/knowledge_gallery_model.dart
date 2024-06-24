import 'package:distributor_empower/model/base/base_model.dart';

class KnowledgeGalleryModel extends BaseModel {
  KnowledgeGalleryModel({
    this.id,
    this.knowledgeName,
    this.imgUrl,
    this.urlType,
    this.titleImageUrl,
    this.shortDescription,
    this.thumbnailImgUrl,
  });

  @override
  KnowledgeGalleryModel fromJson(json) {
    return KnowledgeGalleryModel(
      id: json['Id'],
      knowledgeName: json['Knowledge_Name'],
      imgUrl: json['Img_url'],
      urlType: json['Url_Type'],
      titleImageUrl: json['Title_Image_url'],
      shortDescription: json['Short_Description'],
      thumbnailImgUrl: json['thumbnail_Img_Url'],
    );
  }

  String? id;
  String? knowledgeName;
  String? imgUrl;
  String? urlType;
  String? titleImageUrl;
  String? shortDescription;
  String? thumbnailImgUrl;

  String get getImageURL => (urlType == 'youtube' ? "https://img.youtube.com/vi/${imgUrl.toString().split("=").last}/0.jpg" : thumbnailImgUrl ?? '');

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Knowledge_Name'] = knowledgeName;
    map['Img_url'] = imgUrl;
    map['Url_Type'] = urlType;
    map['Title_Image_url'] = titleImageUrl;
    map['Short_Description'] = shortDescription;
    map['thumbnail_Img_Url'] = thumbnailImgUrl;
    return map;
  }
}
