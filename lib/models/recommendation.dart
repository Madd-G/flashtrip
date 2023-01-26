class Recommendation {
  final String location;
  final String imageUrl;
  final String name;
  final double price;
  final double rating;
  final String description;
  final List images;

  Recommendation({
    required this.location,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.images,
  });
}

List<Recommendation> recommendations = [
  Recommendation(location: 'Malang', imageUrl: 'assets/images/batu-love-garden.png', name: 'Batu Love Garden', price: 75000, rating: 5, description: '', images: []),
  Recommendation(location: 'Yogyakarta', imageUrl: 'assets/images/kedung-penyut.png', name: 'Kedung Penyut', price: 9999, rating: 5, description: '', images: []),
  Recommendation(location: 'Malang', imageUrl: 'assets/images/batu-love-garden.png', name: 'Batu Love Garden', price: 75000, rating: 5, description: '', images: []),
  Recommendation(location: 'Yogyakarta', imageUrl: 'assets/images/kedung-penyut.png', name: 'Kedung Penyut', price: 9999, rating: 5, description: '', images: []),
  Recommendation(location: 'Malang', imageUrl: 'assets/images/batu-love-garden.png', name: 'Batu Love Garden', price: 75000, rating: 5, description: '', images: []),
  Recommendation(location: 'Malang', imageUrl: 'assets/images/batu-love-garden.png', name: 'Batu Love Garden', price: 75000, rating: 5, description: '', images: []),
];