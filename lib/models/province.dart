class Province {
  final String name;
  final String image;
  final List destination;

  Province(
      {required this.name, required this.image, required this.destination});
}

List<Province> provinces = [
  Province(
      name: 'Bali', image: 'assets/images/onboarding-1.png', destination: []),
  Province(
      name: 'Jawa Barat',
      image: 'assets/images/onboarding-3.png',
      destination: []),
  Province(
      name: 'Jawa Timur',
      image: 'assets/images/onboarding-2.png',
      destination: []),
  Province(
      name: 'NTT', image: 'assets/images/onboarding-3.png', destination: []),
  Province(
      name: 'Jawa Tengah',
      image: 'assets/images/onboarding-3.png',
      destination: []),
  Province(
      name: 'Yogyakarta',
      image: 'assets/images/onboarding-1.png',
      destination: []),
  Province(
      name: 'Jakarta',
      image: 'assets/images/onboarding-2.png',
      destination: []),
  Province(
      name: 'Kalimantan',
      image: 'assets/images/onboarding-1.png',
      destination: []),
  Province(
      name: 'Papua', image: 'assets/images/onboarding-2.png', destination: []),
  Province(
      name: 'Jakarta',
      image: 'assets/images/onboarding-2.png',
      destination: []),
  Province(
      name: 'Kalimantan',
      image: 'assets/images/onboarding-1.png',
      destination: []),
  Province(
      name: 'Papua', image: 'assets/images/onboarding-2.png', destination: []),
];
