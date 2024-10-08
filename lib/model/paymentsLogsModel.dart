// ignore_for_file: avoid_print
class PaymentsLogsModel {
  int? id;
  int? userId;
  String? orderId;
  String? paymentMode;
  String? paymentReference;
  dynamic amount;
  String? paymentStatus;
  dynamic signature;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? createdBy;
  int? modifiedBy;

  PaymentsLogsModel({this.id, this.userId, this.orderId, this.paymentMode, this.paymentReference, this.amount, this.paymentStatus, this.signature, this.createdAt, this.updatedAt, this.createdBy, this.modifiedBy,});

  PaymentsLogsModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      userId = json["userId"] ?? 0;
      orderId = json["orderId"] ?? "";
      paymentMode = json["paymentMode"] ?? "";
      paymentReference = json["paymentReference"] ?? "";
      amount = json["amount"] ?? "";
      paymentStatus = json["paymentStatus"] ?? "";
      signature = json["signature"] ?? "";
      createdAt = json['created_at'] != null ? DateTime.parse(json['created_at'].toString()).toLocal() : null;
      updatedAt = DateTime.parse(json["updated_at"]);
      createdBy= json["createdBy"];
    modifiedBy= json["modifiedBy"];

    } catch (e) {
      print("Exception - PaymentsLogsModel.dart - PaymentsLogsModel.fromJson(): ${e.toString()}");
    }
  }
}
