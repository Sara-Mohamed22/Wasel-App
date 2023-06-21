
class UserModel
{
 bool? success;
 Data? data ;
 String? msg ;


 UserModel(this.success ,this.data ,this.msg );

 Map<String, dynamic> toJson()
 {
   return
     {
      "success" : success,
       "data": data?.toJson(),
       "message" : msg ,

     };
 }

 UserModel.FromJson(Map<String , dynamic> json)
 {
   success =json["success"] ;
   msg =json["message"] ;
   data =Data.FromJson( json["data"]) ;

 }

}


class Data
{
  int? id ;
  String? name ;
  dynamic email ;
 dynamic phone ;
  String? type ;
  String? code ;
  String? avater;
  dynamic deviceToken ;
  String? preferredLocal ;
  String? token ;
  String? restToken ;
  bool? verify ;
  String? verifyAt ;
  String? createAt ;
  String? createAtFormat ;


  Data({
    this.id, this.name, this.email,
    this.phone,this.type, this.code, this.avater,
    this.deviceToken, this.preferredLocal,
    this.token, this.createAtFormat,this.createAt,
    this.verifyAt, this.verify, this.restToken});

  Map<String , dynamic> toJson()
  {
    return {
      "id":id,
      "name": name ,
      "email": email ,
      "phone":phone,
      "type": type,
      "code":code,
      "avatar":avater,
      "device_token":deviceToken,
      "preferred_locale":preferredLocal,
      "token":token,
      "reset_token":restToken,
      "verified":verify,
      "verified_at":verifyAt,
      "created_at":createAt,
      "created_at_formatted":createAtFormat
    };
  }

Data.FromJson(Map<String , dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    code = json['code'];
    avater = json['avatar'];
    deviceToken = json['device_token'];
    preferredLocal = json['preferred_locale'];
    token = json['token'];
    restToken = json['reset_token'];
    verify = json['verified'];
    verifyAt = json['verified_at'];
    createAt = json['created_at'];
    createAtFormat = json['created_at_formatted'];
  }


}