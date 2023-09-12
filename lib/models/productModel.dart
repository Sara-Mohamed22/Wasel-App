
class ProductModel
{
 bool? success;
 Data? data ;
 String? msg ;

 ProductModel(this.success ,this.data ,this.msg );

 Map<String, dynamic> toJson()
 {
   return
     {
       "success" : success,
       "data": data?.toJson(),
       "message" : msg ,

     };
 }

 ProductModel.FromJson(Map<String , dynamic> json)
 {
   success =json["success"] ;
   msg =json["message"] ;
   data = json["data"] != null ? Data.FromJson( json["data"]) : null ;

 }

}


class Data {
  List<DataInfo>? data;
  Links? links;
  Meta? meta;

  Data({this.data, this.links, this.meta});

  Data.FromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      data = <DataInfo>[];
      json['data'].forEach((v) {
        data!.add(new DataInfo.fromJson(v));
      });
    }

    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class DataInfo {
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
  bool? isFavored ;
  List<Img>? images ;
  // dynamic images;

  Img? defaultImage;
  // dynamic defaultImage;

  List<CustomFields>? customFields;
  // dynamic customFields;

  Offer? availableOffer;
  // dynamic availableOffer;

  List<dynamic>? textOptions;
  List<dynamic>? selectOptions;
  int? initalQuantity   ;


  DataInfo(
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
        this.isFavored ,
        this.images,
        this.defaultImage,
        this.customFields,
        this.availableOffer,
        this.textOptions,
        this.initalQuantity ,
        this.selectOptions});


  DataInfo.fromJson(Map<String, dynamic> json) {
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
    code = json['code'];
    initalQuantity = json['initalQuantity'] != null ? json['initalQuantity'] : 1 ;
    isFavored = json["isFavored"];

    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(Img.fromJson(v));
      });
    }

    defaultImage = json['default_image'] != null
        ? new Img.fromJson(json['default_image'])
        : null;

    if (json['customFields'] != null) {
      customFields = <CustomFields>[];
      json['customFields'].forEach((v) {
        customFields!.add(new CustomFields.fromJson(v));
      });
    }

    availableOffer = json['availableOffer'] != null ?
    Offer.FromJson( json['availableOffer'] ) : null ;

    if (json['textOptions'] != null) {
      textOptions = [];
      json['textOptions'].forEach((v) {
        textOptions!.add(v);
      });
    }

    if (json['selectOptions'] != null) {
      selectOptions = [];
      json['selectOptions'].forEach((v) {
        selectOptions!.add(v);
      });
    }
  }




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['initalQuantity'] = initalQuantity  ;


    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList() ;
    }

    if (this.defaultImage != null) {
      data['default_image'] = this.defaultImage!.toJson();
    }

    if (this.customFields != null) {
      data['customFields'] = this.customFields!.map((v) => v.toJson()).toList();
    }

    data['availableOffer'] = this.availableOffer?.toJson() ;

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

class CustomFields {
  int? id;
  String? name;
  String? type;
  List<CustomFieldOptions>? customFieldOptions;

  CustomFields({this.id, this.name, this.type, this.customFieldOptions});

  CustomFields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    if (json['customFieldOptions'] != null) {
      customFieldOptions = <CustomFieldOptions>[];
      json['customFieldOptions'].forEach((v) {
        customFieldOptions!.add(new CustomFieldOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.customFieldOptions != null) {
      data['customFieldOptions'] =
          this.customFieldOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomFieldOptions {
  int? id;
  String? name;
  double? additionalPrice;
  String? product;

  CustomFieldOptions({this.id, this.name, this.additionalPrice, this.product});

  CustomFieldOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    additionalPrice = json['additional_price'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['additional_price'] = this.additionalPrice;
    data['product'] = this.product;
    return data;
  }
}



class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}



class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {

      links = <Link>[];
      json['links'].forEach((v) {
        links!.add(new Link.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }


}



class Link {
  String? url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  Link.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    return
      {
        "url":url,
        "label":label,
        "active":active
      };
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