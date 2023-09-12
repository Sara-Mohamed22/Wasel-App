class SliderImgModel
{
  bool? success;
  List<Data>? data;
  String? message;

  SliderImgModel({this.success, this.data, this.message});

  SliderImgModel.FromJson(Map<String, dynamic> json) {
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
  String? name;
  bool? showName;
  String? namePosition;
  String? itemType;
  String? blockType;
  List<ModelId>? modelId;

  Data(
      {this.id,
        this.name,
        this.showName,
        this.namePosition,
        this.itemType,
        this.blockType,
        this.modelId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    showName = json['show_name'];
    namePosition = json['name_position'];
    itemType = json['item_type'];
    blockType = json['block_type'];

    if (json['model_id'] != null)
    {
      modelId = <ModelId>[];
      json['model_id'].forEach((v) {
        modelId!.add(new ModelId.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['show_name'] = this.showName;
    data['name_position'] = this.namePosition;
    data['item_type'] = this.itemType;
    data['block_type'] = this.blockType;

    if (this.modelId != null) {
      data['model_id'] = this.modelId!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelId {
  dynamic id;
  String? name;
  String? type;
  Image? image;

  ModelId({this.id, this.name, this.type, this.image});

  ModelId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  String? thumb;
  String? small;
  String? medium;
  String? large;
  String? extraLarge;
  String? original;

  Image(
      {this.thumb,
        this.small,
        this.medium,
        this.large,
        this.extraLarge,
        this.original});

  Image.fromJson(Map<String, dynamic> json) {
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