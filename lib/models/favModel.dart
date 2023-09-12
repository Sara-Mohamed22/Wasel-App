class FavModel {
  bool? success;
  List<Data>? data;
  String? message;

  FavModel({this.success, this.data, this.message});

  FavModel.fromJson(Map<String, dynamic> json) {

    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? type;
  Product? product;
  String? createdAt;
  String? createdAtFormatted;

  Data(
      {this.id,
        this.type,
        this.product,
        this.createdAt,
        this.createdAtFormatted});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
    createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['created_at_formatted'] = this.createdAtFormatted;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  dynamic description;
  dynamic miniDescription;
  dynamic price;
  dynamic oldPrice;
  String? weight;
  String? weightUnit;
  int? stock;
  String? stockType;
  bool? canBuy;
  String? code;
  List<Images>? images;
  Images? defaultImage;
  List<dynamic>? customFields;
 dynamic availableOffer;
  List<dynamic>? textOptions;
  List<dynamic>? selectOptions;
  bool? isFavored ;

  Product(
      {this.id,
        this.name,
        this.description,
        this.miniDescription,
        this.price,
        this.oldPrice,
        this.weight,
        this.weightUnit,
        this.stock,
        this.stockType,
        this.canBuy,
        this.code,
        this.images,
        this.defaultImage,
        this.customFields,
        this.availableOffer,
        this.textOptions,
        this.isFavored ,
        this.selectOptions});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    miniDescription = json['mini_description'];
    price = json['price'];
    oldPrice = json['old_price'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    stock = json['stock'];
    stockType = json['stock_type'];
    canBuy = json['can_buy'];
    isFavored = json["isFavored"];
    code = json['code'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    defaultImage = json['default_image'] != null
        ? new Images.fromJson(json['default_image'])
        : null;

    // if (json['customFields'] != null) {
    //   customFields = [];
    //   json['customFields'].forEach((v) {
    //     customFields!.add(new Null.fromJson(v));
    //   });
    // }

    customFields = json['customFields'];

    // availableOffer = json['availableOffer'];
    // if (json['textOptions'] != null) {
    //   textOptions = <Null>[];
    //   json['textOptions'].forEach((v) {
    //     textOptions!.add(new Null.fromJson(v));
    //   });
    // }

    textOptions = json['textOptions'] ;

    // if (json['selectOptions'] != null) {
    //   selectOptions = <Null>[];
    //   json['selectOptions'].forEach((v) {
    //     selectOptions!.add(new Null.fromJson(v));
    //   });
    // }

    selectOptions = json['selectOptions'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['mini_description'] = this.miniDescription;
    data['price'] = this.price;
    data['isFavored'] = this.isFavored ;
    data['old_price'] = this.oldPrice;
    data['weight'] = this.weight;
    data['weight_unit'] = this.weightUnit;
    data['stock'] = this.stock;
    data['stock_type'] = this.stockType;
    data['can_buy'] = this.canBuy;
    data['code'] = this.code;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.defaultImage != null) {
      data['default_image'] = this.defaultImage!.toJson();
    }
    if (this.customFields != null) {
      data['customFields'] = this.customFields!.map((v) => v.toJson()).toList();
    }
    data['availableOffer'] = this.availableOffer;
    if (this.textOptions != null) {
      data['textOptions'] = this.textOptions!.map((v) => v.toJson()).toList();
    }
    if (this.selectOptions != null) {
      data['selectOptions'] =
          this.selectOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? thumb;
  String? small;
  String? medium;
  String? large;
  String? extraLarge;
  String? original;

  Images(
      {this.thumb,
        this.small,
        this.medium,
        this.large,
        this.extraLarge,
        this.original});

  Images.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
    extraLarge = json['extra_large'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb'] = this.thumb;
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    data['extra_large'] = this.extraLarge;
    data['original'] = this.original;
    return data;
  }
}