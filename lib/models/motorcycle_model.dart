class Motorcycle {
  final String imageUrl;
  final String carName;
  final double price;

  Motorcycle({required this.imageUrl, required this.carName, required this.price});
}

final List<Motorcycle> motorcycles = [
  Motorcycle(imageUrl: 'assets/images/vario.png', carName: 'Vario 125', price: 30000),
  Motorcycle(imageUrl: 'assets/images/honda.png', carName: 'Honda', price: 30000),
  Motorcycle(imageUrl: 'assets/images/kawasaki.png', carName: 'Kawasaki', price: 60000),
  Motorcycle(imageUrl: 'assets/images/tiger.png', carName: 'Honda Tiger', price: 60000),
];