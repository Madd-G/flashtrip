class TransactionModel {
  String? id;
  String? userId;
  String? productId;
  String? customerId;
  int? productPrice;
  int? adminFee;
  int? totalPrice;

  TransactionModel({
    this.id,
    this.userId,
    this.productId,
    this.customerId,
    this.productPrice,
    this.adminFee,
    this.totalPrice,
  });
}