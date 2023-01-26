class PaymentMethod {
  final String image;
  final String name;

  PaymentMethod({required this.image, required this.name});
}

List<PaymentMethod> retailStores = [
  PaymentMethod(image: 'assets/images/indomart.png', name: 'Indomaret'),
  PaymentMethod(image: 'assets/images/alfamart.png', name: 'Alfamart'),
];

List<PaymentMethod> bankTransfer = [
  PaymentMethod(image: 'assets/images/Mandiri.png', name: 'Mandiri'),
  PaymentMethod(image: 'assets/images/BCA.png', name: 'BCA'),
  PaymentMethod(image: 'assets/images/BNI.png', name: 'BNI'),
  PaymentMethod(image: 'assets/images/bank-jago.png', name: 'Bank Jago'),
  PaymentMethod(image: 'assets/images/Mandiri.png', name: 'Mandiri'),
  PaymentMethod(image: 'assets/images/BCA.png', name: 'BCA'),
  PaymentMethod(image: 'assets/images/BNI.png', name: 'BNI'),
  PaymentMethod(image: 'assets/images/bank-jago.png', name: 'Bank Jago'),
];
