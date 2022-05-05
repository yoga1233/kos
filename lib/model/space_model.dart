import 'package:equatable/equatable.dart';

class SpaceModel extends Equatable {
  final int id;
  final String name;
  final String city;
  final String country;
  final int price;
  final String imageUrl;
  final int rating;
  final String address;
  final String phone;
  final String mapUrl;
  final List<String> photos;
  final int numberOfKitchens;
  final int numberOfBedrooms;
  final int numberOfCupboards;

  const SpaceModel({
    this.id = 0,
    this.name = '',
    this.city = '',
    this.country = '',
    this.price = 0,
    this.imageUrl = '',
    this.rating = 0,
    this.address = '',
    this.phone = '',
    this.mapUrl = '',
    this.photos = const [''],
    this.numberOfKitchens = 0,
    this.numberOfBedrooms = 0,
    this.numberOfCupboards = 0,
  });

  factory SpaceModel.fromJson(json) => SpaceModel(
        id: json['id'],
        name: json['name'],
        city: json['city'],
        country: json['country'],
        price: json['price'],
        imageUrl: json['image_url'],
        rating: json['rating'],
        address: json['address'],
        phone: json['phone'],
        mapUrl: json['map_url'],
        photos: json['photos'].cast<String>(),
        numberOfKitchens: json['number_of_kitchens'],
        numberOfBedrooms: json['number_of_bedrooms'],
        numberOfCupboards: json['number_of_cupboards'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        city,
        country,
        price,
        imageUrl,
        rating,
        address,
        phone,
        mapUrl,
        photos,
        numberOfKitchens,
        numberOfCupboards,
        numberOfBedrooms,
      ];
}
