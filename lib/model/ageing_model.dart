import 'package:distributor_empower/model/base/base_model.dart';

class AgeingResponse extends BaseModel {
  AgeingResponse({
    this.distributorUserID,
    this.sapcode,
    this.distributor,
    this.state,
    this.lblBal1,
    this.lblBal2,
    this.lblBal3,
    this.lblBal4,
    this.lblBal5,
    this.lblBal6,
    this.lblBal7,
    this.lblBal8,
    this.balance,
    this.creditLimit,
    this.lbl1,
    this.lbl2,
    this.lbl3,
    this.lbl4,
    this.lbl5,
    this.lbl6,
    this.lbl7,
    this.lbl8,
    this.todayOrder,
    this.availableCredit,
  });

  @override
  AgeingResponse fromJson(dynamic json) {
    return AgeingResponse(
      distributorUserID: json['DistributorUserID'],
      sapcode: json['Sapcode'],
      distributor: json['Distributor'],
      state: json['State'],
      lblBal1: json['lblBal_1'],
      lblBal2: json['lblBal_2'],
      lblBal3: json['lblBal_3'],
      lblBal4: json['lblBal_4'],
      lblBal5: json['lblBal_5'],
      lblBal6: json['lblBal_6'],
      lblBal7: json['lblBal_7'],
      lblBal8: json['lblBal_8'],
      balance: json['Balance'],
      creditLimit: json['CreditLimit'],
      lbl1: json['lbl_1'],
      lbl2: json['lbl_2'],
      lbl3: json['lbl_3'],
      lbl4: json['lbl_4'],
      lbl5: json['lbl_5'],
      lbl6: json['lbl_6'],
      lbl7: json['lbl_7'],
      lbl8: json['lbl_8'],
      todayOrder: json['TodayOrder'],
      availableCredit: json['AvailableCredit'],
    );
  }

  String? distributorUserID;
  String? sapcode;
  String? distributor;
  String? state;
  String? lblBal1;
  String? lblBal2;
  String? lblBal3;
  String? lblBal4;
  String? lblBal5;
  String? lblBal6;
  String? lblBal7;
  String? lblBal8;
  String? balance;
  String? creditLimit;
  String? lbl1;
  String? lbl2;
  String? lbl3;
  String? lbl4;
  String? lbl5;
  String? lbl6;
  String? lbl7;
  String? lbl8;
  String? todayOrder;
  String? availableCredit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DistributorUserID'] = distributorUserID;
    map['Sapcode'] = sapcode;
    map['Distributor'] = distributor;
    map['State'] = state;
    map['lblBal_1'] = lblBal1;
    map['lblBal_2'] = lblBal2;
    map['lblBal_3'] = lblBal3;
    map['lblBal_4'] = lblBal4;
    map['lblBal_5'] = lblBal5;
    map['lblBal_6'] = lblBal6;
    map['lblBal_7'] = lblBal7;
    map['lblBal_8'] = lblBal8;
    map['Balance'] = balance;
    map['CreditLimit'] = creditLimit;
    map['lbl_1'] = lbl1;
    map['lbl_2'] = lbl2;
    map['lbl_3'] = lbl3;
    map['lbl_4'] = lbl4;
    map['lbl_5'] = lbl5;
    map['lbl_6'] = lbl6;
    map['lbl_7'] = lbl7;
    map['lbl_8'] = lbl8;
    map['TodayOrder'] = todayOrder;
    map['AvailableCredit'] = availableCredit;
    return map;
  }
}
