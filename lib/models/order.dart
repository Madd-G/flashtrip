class Order {
  final String status;
  final String destinationName;
  final String from;
  final String to;
  final String date;
  final String time;
  final String arrivalTime;
  final String barcode;
  final String bookingCode;

  Order(
      {required this.status,
      required this.destinationName,
      required this.from,
      required this.to,
      required this.date,
      required this.time,
      required this.arrivalTime,
      required this.barcode,
      required this.bookingCode});
}

List<Order> orders = [
  Order(
      status: 'Proses',
      destinationName: 'DreamLand',
      from: 'Jakarta',
      to: 'Bali',
      date: 'Minggu 25 Januari 2022',
      time: '10:11',
      arrivalTime: '13:00',
      barcode: 'assets/images/barcode.png',
      bookingCode: '9129394'),
  Order(
      status: 'success',
      destinationName: 'DreamLand',
      from: 'Jakarta',
      to: 'Bali',
      date: 'Minggu 25 Januari 2022',
      time: '10:11',
      arrivalTime: '13:00',
      barcode: 'assets/images/barcode.png',
      bookingCode: '9129394'),
  Order(
      status: 'Dibatalkan',
      destinationName: 'DreamLand',
      from: 'Jakarta',
      to: 'Bali',
      date: 'Minggu 25 Januari 2022',
      time: '10:11',
      arrivalTime: '13:00',
      barcode: 'assets/images/barcode.png',
      bookingCode: '9129394'),
  Order(
      status: 'Proses',
      destinationName: 'DreamLand',
      from: 'Jakarta',
      to: 'Bali',
      date: 'Minggu 25 Januari 2022',
      time: '10:11',
      arrivalTime: '13:00',
      barcode: 'assets/images/barcode.png',
      bookingCode: '9129394'),
  Order(
      status: 'success',
      destinationName: 'DreamLand',
      from: 'Jakarta',
      to: 'Bali',
      date: 'Minggu 25 Januari 2022',
      time: '10:11',
      arrivalTime: '13:00',
      barcode: 'assets/images/barcode.png',
      bookingCode: '9129394'),
  Order(
      status: 'Dibatalkan',
      destinationName: 'DreamLand',
      from: 'Jakarta',
      to: 'Bali',
      date: 'Minggu 25 Januari 2022',
      time: '10:11',
      arrivalTime: '13:00',
      barcode: 'assets/images/barcode.png',
      bookingCode: '9129394'),
];
