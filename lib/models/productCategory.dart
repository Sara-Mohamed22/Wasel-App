

class ProductOFCategory {
  bool? success;
  Data? data;
  String? message;

  ProductOFCategory({this.success, this.data, this.message});

  ProductOFCategory.FromJson(Map<String, dynamic> json) {
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
  List<Children>? children;
  List<Products>? products;
  Img? image;

  Data({this.id, this.name, this.children, this.products, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    image = json['image'] != null ? new Img.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Children {
  int? id;
  String? name;
  Img? image;

  Children({this.id, this.name, this.image});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'] != null ? new Img.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}



class Img {
  String? thumb;
  String? small;
  String? medium;
  String? large;
  String? extraLarge;
  String? original;

  Img(
      {this.thumb,
        this.small,
        this.medium,
        this.large,
        this.extraLarge,
        this.original});

  Img.fromJson(Map<String, dynamic> json) {
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


class Products {
  int? id;
  String? name;
  String? description;
  String? miniDescription;
  dynamic price;
  dynamic oldPrice;
  String? weight;
  String? weightUnit;
  int? stock;
  String? stockType;
  bool? canBuy;
  String? code;
  List<Img>? images ;
  Img? defaultImage;
  dynamic customFields;
  Offer? availableOffer;
  bool? isFavored ;
  dynamic textOptions;
  dynamic selectOptions;

  int? initalQuantity   ;


  Products(
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
        this.initalQuantity ,
        this.selectOptions});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    miniDescription = json['mini_description'];
    price = json['price'];
    oldPrice = json['old_price'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    stock = json['stock'];
    isFavored = json["isFavored"];
    stockType = json['stock_type'];
    canBuy = json['can_buy'];
    code = json['code'];
    if (json['images'] != null) {
      images = <Img>[];
      json['images'].forEach((v) {
        images!.add(new Img.fromJson(v));
      });
    }
    defaultImage = json['default_image'] != null
        ? new Img.fromJson(json['default_image'])
        : null;

      customFields = json['customFields'];

    availableOffer = json['availableOffer'] != null ?
    Offer.FromJson( json['availableOffer'] ) : null ;

      textOptions = json['textOptions'];

      selectOptions = json['selectOptions'];

    initalQuantity = json['initalQuantity'] !=null ? json['initalQuantity'] : 1;


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['initalQuantity'] = initalQuantity  ;

    data['id'] = this.id;
    data["isFavored"]= this.isFavored ;
    data['name'] = this.name;
    data['description'] = this.description;
    data['mini_description'] = this.miniDescription;
    data['price'] = this.price;
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
      data['customFields'] = this.customFields ;
    }


    data['availableOffer'] = this.availableOffer?.toJson() ;

    if (this.selectOptions != null) {
      data['selectOptions'] =
          this.selectOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offer
{
  int? id;
  int? percentDiscountPrice ;
  int? modelID ;
  String? modelType ;
  String? expireAt ;
  bool? userBuyOne ;
  String? createAt ;
  String? updateAt ;
  int? duration ;
  String? name ;
  List<Translation>? translation ;

  Map<String, dynamic> toJson()
  {
    return {
      "id":id,
      "percentage_discount_price": percentDiscountPrice,
      "model_id":modelID,
      "model_type":modelType,
      "expire_at":expireAt ,
      "user_buy_one":userBuyOne,
      "created_at": createAt ,
      "updated_at": updateAt ,
      "duration": duration ,
      "name": name ,
      "translations": translation?.map((e) => e.toJson()).toList() ,
    };
  }

  Offer.FromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    percentDiscountPrice = json["percentage_discount_price"];
    modelID = json['model_id'];
    modelType = json['model_type'];
    expireAt = json['expire_at'];
    userBuyOne = json['user_buy_one'];
    createAt = json['created_at'];
    updateAt = json["updated_at"];
    duration = json['duration'];
    name = json['name'];

    if(json["translations"] != null)
    {
      translation = [] ;

      json["translations"].forEach((e) {
        translation?.add(e.toJson());
      });
    }

  }

}


class  Translation
{

  int? id ;
  int? offerId ;
  String? name ;
  String? local ;

  Map<String ,dynamic > toJson()
  {
    return
      {
        "id": id,
        "offer_id": offerId,
        "name":name,
        "locale":local
      };

  }

  Translation.FromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    offerId = json['offer_id'];
    name = json['name'];
    local = json['local'];
  }

}