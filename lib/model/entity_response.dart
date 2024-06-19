import 'package:distributor_empower/model/base/base_model.dart';

class EntityResponse extends BaseModel {
  EntityResponse({
    this.id,
    this.menuName,
    this.menuStartDate,
    this.menuEndDate,
    this.menuImagePath,
    this.menuPDFURL,
    this.menuRedairectURL,
    this.menuRedairectURLIsPDF,
    this.description,
    this.shortDescription,
    this.status,
  });

  @override
  EntityResponse fromJson(dynamic json) {
    return EntityResponse(
      id: json['Id'],
      menuName: json['Menu_Name'],
      menuStartDate: json['Menu_StartDate'],
      menuEndDate: json['Menu_EndDate'],
      menuImagePath: json['Menu_ImagePath'],
      menuPDFURL: json['Menu_PDF_URL'],
      menuRedairectURL: json['Menu_Redairect_URL'],
      menuRedairectURLIsPDF: json['Menu_Redairect_URL_IsPDF'],
      description: json['Description'],
      shortDescription: json['ShortDescription'],
      status: json['status'],
    );
  }

  String? id;
  String? menuName;
  String? menuStartDate;
  String? menuEndDate;
  String? menuImagePath;
  String? menuPDFURL;
  String? menuRedairectURL;
  String? menuRedairectURLIsPDF;
  String? description;
  String? shortDescription;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Menu_Name'] = menuName;
    map['Menu_StartDate'] = menuStartDate;
    map['Menu_EndDate'] = menuEndDate;
    map['Menu_ImagePath'] = menuImagePath;
    map['Menu_PDF_URL'] = menuPDFURL;
    map['Menu_Redairect_URL'] = menuRedairectURL;
    map['Menu_Redairect_URL_IsPDF'] = menuRedairectURLIsPDF;
    map['Description'] = description;
    map['ShortDescription'] = shortDescription;
    map['status'] = status;
    return map;
  }
}
