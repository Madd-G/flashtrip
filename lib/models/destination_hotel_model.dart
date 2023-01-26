class DestinationHotelModel {
  List<Data>? data;

  DestinationHotelModel({this.data});

  DestinationHotelModel.fromJson(Map<String, dynamic> json) {
    data = <Data>[];

    json['data'].forEach((v) {
      data!.add(Data.fromJson(v));
    });
  }
}

class Data {
  int? id;
  String? name;
  String? location;
  String? image;
  String? category;
  int? price;
  String? address;
  String? checkIn;
  String? checkOut;
  String? description;
  String? facilities;
  String? images;

  Data({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.category,
    required this.price,
    required this.address,
    required this.checkIn,
    required this.checkOut,
    required this.description,
    required this.facilities,
    required this.images,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    image = json['image'];
    category = json['category'];
    price = json['price'];
    address = json['address'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    description = json['description'];
    facilities = json['facilities'];
    images = json['images'];
  }
}
