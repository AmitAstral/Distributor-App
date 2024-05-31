class APIReqData {
  int? page;
  String? email;
  String? password;

  APIReqData({this.page, this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['page'] = page;
    json['email'] = email;
    json['password'] = password;
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
