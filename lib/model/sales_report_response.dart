import 'package:distributor_empower/model/base/base_model.dart';

class SalesReportResponse extends BaseModel {
  SalesReportResponse({
    this.invoiceNo,
    this.invoiceDate,
    this.invoiceAmt,
    this.lRNo,
    this.lRDate,
    this.vDate,
  });

  @override
  SalesReportResponse fromJson(dynamic json) {
    return SalesReportResponse(
      invoiceNo: json['InvoiceNo'],
      invoiceDate: json['InvoiceDate'],
      invoiceAmt: json['InvoiceAmt'],
      lRNo: json['LRNo'],
      lRDate: json['LRDate'],
      vDate: json['v_Date'],
    );
  }

  String? invoiceNo;
  String? invoiceDate;
  String? invoiceAmt;
  String? lRNo;
  String? lRDate;
  String? vDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['InvoiceNo'] = invoiceNo;
    map['InvoiceDate'] = invoiceDate;
    map['InvoiceAmt'] = invoiceAmt;
    map['LRNo'] = lRNo;
    map['LRDate'] = lRDate;
    map['v_Date'] = vDate;
    return map;
  }
}
