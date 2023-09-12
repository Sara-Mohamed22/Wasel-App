

class OrderModel {
  bool? success;
  BData? bdata;
  String? message;

  OrderModel({this.success, this.bdata, this.message});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    // BData = json['data'] != null ?  BData.fromJson(json['data']) : null;
    bdata = BData.fromJson( json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.bdata != null) {
      data['data'] = this.bdata!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class BData
{
  List<Data>? bdata ;

  BData.fromJson(Map<String, dynamic> json )
  {
    List<Data> list = [];

    json['data'].forEach((e)
    {
     list.add(Data.fromJson(e));
    });

    bdata = list ;

  }

  Map<String , dynamic> toJson()
  {
    return {
      "data" : bdata?.map((e) => e.toJson() )
    };
  }
}



class Data {
  int? id;
  String? status;
  String? deliveryTime;
  String? statusNote;
  String? statusColor;
  int? subTotal;
  int? shippingCost;
  int? taxTotal;
  int? discount;
  int? total;
  String? createdAt;
  String? updatedAt;
  String? createdAtFormatted;
  String? updatedAtFormatted;
  Address? address;
  Payment? payment;
  List<OrderItems>? orderItems;
  dynamic taxesApplied;

  Data(
      {this.id,
        this.status,
        this.deliveryTime,
        this.statusNote,
        this.statusColor,
        this.subTotal,
        this.shippingCost,
        this.taxTotal,
        this.discount,
        this.total,
        this.createdAt,
        this.updatedAt,
        this.createdAtFormatted,
        this.updatedAtFormatted,
        this.address,
        this.payment,
        this.orderItems,
        this.taxesApplied});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    deliveryTime = json['delivery_time'];
    statusNote = json['status_note'];
    statusColor = json['status_color'];
    subTotal = json['sub_total'];
    shippingCost = json['shipping_cost'];
    taxTotal = json['tax_total'];
    discount = json['discount'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAtFormatted = json['created_at_formatted'];
    updatedAtFormatted = json['updated_at_formatted'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    payment =
    json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
    // if (json['taxes_applied'] != null) {
    //   taxesApplied = [];
    //   json['taxes_applied'].forEach((v) {
    //     taxesApplied!.add(new Null.fromJson(v));
    //   });
    // }
    json['taxes_applied'] = taxesApplied ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['delivery_time'] = this.deliveryTime;
    data['status_note'] = this.statusNote;
    data['status_color'] = this.statusColor;
    data['sub_total'] = this.subTotal;
    data['shipping_cost'] = this.shippingCost;
    data['tax_total'] = this.taxTotal;
    data['discount'] = this.discount;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_at_formatted'] = this.createdAtFormatted;
    data['updated_at_formatted'] = this.updatedAtFormatted;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    if (this.taxesApplied != null) {
      data['taxes_applied'] =
          this.taxesApplied!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
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

  Address(
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

  Address.fromJson(Map<String, dynamic> json) {
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

class Payment {
  int? id;
  String? name;
  bool? active;
  Icon? icon;

  Payment({this.id, this.name, this.active, this.icon});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    active = json['active'];
    icon = json['icon'] != null ? new Icon.fromJson(json['icon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['active'] = this.active;
    if (this.icon != null) {
      data['icon'] = this.icon!.toJson();
    }
    return data;
  }
}

class Icon {
  String? thumb;
  String? small;
  String? medium;
  String? large;
  String? extraLarge;
  String? original;

  Icon(
      {this.thumb,
        this.small,
        this.medium,
        this.large,
        this.extraLarge,
        this.original});

  Icon.fromJson(Map<String, dynamic> json) {
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

class OrderItems {
  int? id;
  String? name;
  int? quantity;
  String? price;
  int? total;

  OrderItems({this.id, this.name, this.quantity, this.price, this.total});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total'] = this.total;
    return data;
  }
}