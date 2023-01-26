class Car {
  final String imageUrl;
  final String carName;
  final String category;
  final double price;
  final int capacity;
  final double distancePerLiter;
  final String address;

  Car(
      {required this.imageUrl,
      required this.carName,
      required this.category,
      required this.price,
      required this.capacity,
      required this.distancePerLiter,
      required this.address});
}

final List<Car> cars = [
  Car(
    imageUrl: 'assets/images/daihatsu-sirion.png',
    category: 'private',
    carName: 'Daihatsu Sirion',
    price: 50000,
    capacity: 6,
    distancePerLiter: 11.5,
    address:
        'Jl. Sekar Tunjung II No.22, Kesiman Kertalangu, Kec. Denpasar Tim., Kota Denpasar, Bali',
  ),
  Car(
    imageUrl: 'assets/images/honda-mobilio.png',
    category: 'private',
    carName: 'Honda Mobilio',
    price: 45000,
    capacity: 6,
    distancePerLiter: 11.5,
    address:
        'Jl. Sekar Tunjung II No.22, Kesiman Kertalangu, Kec. Denpasar Tim., Kota Denpasar, Bali',
  ),
  Car(
    imageUrl: 'assets/images/toyota-sienta.png',
    category: 'private',
    carName: 'Toyota Sienta',
    price: 50000,
    capacity: 6,
    distancePerLiter: 11.5,
    address:
        'Jl. Sekar Tunjung II No.22, Kesiman Kertalangu, Kec. Denpasar Tim., Kota Denpasar, Bali',
  ),
  Car(
    imageUrl: 'assets/images/daihatsu-rocky.png',
    category: 'private',
    carName: 'Daihatsu Rocky',
    price: 45000,
    capacity: 6,
    distancePerLiter: 11.5,
    address:
        'Jl. Sekar Tunjung II No.22, Kesiman Kertalangu, Kec. Denpasar Tim., Kota Denpasar, Bali',
  ),
  Car(
    imageUrl: 'assets/images/agya.png',
    category: 'family',
    carName: 'Toyota Agya',
    price: 50000,
    capacity: 6,
    distancePerLiter: 11.5,
    address:
        'Jl. Sekar Tunjung II No.22, Kesiman Kertalangu, Kec. Denpasar Tim., Kota Denpasar, Bali',
  ),
  Car(
    imageUrl: 'assets/images/honda-mobilio.png',
    category: 'private',
    carName: 'Honda Mobilio',
    price: 45000,
    capacity: 6,
    distancePerLiter: 11.5,
    address:
        'Jl. Sekar Tunjung II No.22, Kesiman Kertalangu, Kec. Denpasar Tim., Kota Denpasar, Bali',
  ),
  Car(
    imageUrl: 'assets/images/toyota-sienta.png',
    category: 'private',
    carName: 'Toyota Sienta',
    price: 50000,
    capacity: 6,
    distancePerLiter: 11.5,
    address:
        'Jl. Sekar Tunjung II No.22, Kesiman Kertalangu, Kec. Denpasar Tim., Kota Denpasar, Bali',
  ),
  Car(
    imageUrl: 'assets/images/daihatsu-rocky.png',
    category: 'private',
    carName: 'Daihatsu Rocky',
    price: 45000,
    capacity: 6,
    distancePerLiter: 11.5,
    address:
        'Jl. Sekar Tunjung II No.22, Kesiman Kertalangu, Kec. Denpasar Tim., Kota Denpasar, Bali',
  ),
];
