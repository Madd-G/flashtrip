class DestinationModel {
  List<DestinationData>? data;

  DestinationModel({this.data});

  DestinationModel.fromJson(Map<String, dynamic> json) {
    data = <DestinationData>[];

    json['data'].forEach((v) {
      data!.add(DestinationData.fromJson(v));
    });
  }
}

class DestinationData {
  int? id;
  String? image;
  String? name;
  String? location;
  double? lat;
  double? long;
  String? category;
  int? price;
  String? address;
  String? dayOpen;
  String? timeOpen;
  String? description;
  String? images;

  DestinationData({
    required this.id,
    required this.image,
    required this.location,
    required this.lat,
    required this.long,
    required this.name,
    required this.category,
    required this.price,
    required this.address,
    required this.dayOpen,
    required this.timeOpen,
    required this.description,
    required this.images,
  });

  DestinationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    location = json['location'];
    lat = json['lat'];
    long = json['long'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
    address = json['address'];
    dayOpen = json['day'];
    timeOpen = json['time'];
    description = json['description'];
    images = json['images'];
  }
}
