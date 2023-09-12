class AddressModel {
  bool? success;
  Data? data;
  String? message;

  AddressModel({this.success, this.data, this.message});

  AddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}



class Data {
  int? id;
  String? name;
  String? description;
  String? cityName;
  String? countryName;
  String? cityId;
  String? regionId;
  String? regionName;
  bool? isDefault;
  String? lat;
  String? lng;

  Data(
      {this.id,
        this.name,
        this.description,
        this.cityName,
        this.countryName,
        this.cityId,
        this.regionId,
        this.regionName,
        this.isDefault,
        this.lat,
        this.lng});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    cityName = json['cityName'];
    countryName = json['countryName'];
    cityId = json['cityId'];
    regionId = json['regionId'];
    regionName = json['regionName'];
    isDefault = json['is_default'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['cityName'] = this.cityName;
    data['countryName'] = this.countryName;
    data['cityId'] = this.cityId;
    data['regionId'] = this.regionId;
    data['regionName'] = this.regionName;
    data['is_default'] = this.isDefault;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}