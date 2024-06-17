import 'package:distributor_empower/model/base/base_model.dart';

class StatementResponse extends BaseModel {
  StatementResponse({
    this.distributorId,
    this.date,
    this.narration,
    this.debitCredit,
    this.balance,
    this.color,
  });

  String? distributorId;
  String? date;
  String? narration;
  String? debitCredit;
  String? balance;
  String? color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Distributor_Id'] = distributorId;
    map['DATE'] = date;
    map['Narration'] = narration;
    map['DebitCredit'] = debitCredit;
    map['balance'] = balance;
    map['Color'] = color;
    return map;
  }

  @override
  StatementResponse fromJson(Map<String, dynamic> json) {
    return StatementResponse(
      distributorId: json['Distributor_Id'],
      date: json['DATE'],
      narration: json['Narration'],
      debitCredit: json['DebitCredit'],
      balance: json['balance'],
      color: json['Color'],
    );
  }
}
