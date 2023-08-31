class HotelModel {
  int? id;
  String? name;
  String? adress;
  int? minimalPrice;
  String? priceForIt;
  int? rating;
  String? ratingName;
  List<String>? imageUrls;
  AboutTheHotel? aboutTheHotel;

  HotelModel({
    this.id,
    this.name,
    this.adress,
    this.minimalPrice,
    this.priceForIt,
    this.rating,
    this.ratingName,
    this.imageUrls,
    this.aboutTheHotel,
  });

  HotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adress = json['adress'];
    minimalPrice = json['minimal_price'];
    priceForIt = json['price_for_it'];
    rating = json['rating'];
    ratingName = json['rating_name'];
    imageUrls = json['image_urls'].cast<String>();
    aboutTheHotel = json['about_the_hotel'] != null
        ? AboutTheHotel.fromJson(json['about_the_hotel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['adress'] = adress;
    data['minimal_price'] = minimalPrice;
    data['price_for_it'] = priceForIt;
    data['rating'] = rating;
    data['rating_name'] = ratingName;
    data['image_urls'] = imageUrls;
    if (aboutTheHotel != null) {
      data['about_the_hotel'] = aboutTheHotel!.toJson();
    }
    return data;
  }
}

class AboutTheHotel {
  String? description;
  List<String>? peculiarities;

  AboutTheHotel({this.description, this.peculiarities});

  AboutTheHotel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    peculiarities = json['peculiarities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['peculiarities'] = peculiarities;
    return data;
  }
}
