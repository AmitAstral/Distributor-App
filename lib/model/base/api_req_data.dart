class ApiReqData {
  int? page;
  String? email;
  String? password;
  String? sapCode;

  ApiReqData({this.page, this.email, this.password, this.sapCode});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['page'] = page;
    json['email'] = email;
    json['password'] = password;
    json['Sapcode'] = sapCode;
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
