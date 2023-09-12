class ContactModel
{
  bool? success ;
  Data? data ;
  String? msg ;

  ContactModel(this.data , this.success , this.msg );

  Map<String, dynamic> toJson()
  {
    return
      {
        "success": success ,
        "data": data?.toJson(),
        "message":msg
      };
  }

  ContactModel.FromJson(Map<String, dynamic>json)
  {
    success = json["success"];
    msg = json["message"];
    data = json["data"] != null ? Data.FromJson(json["data"]) : null ;
  }

}


class Data
{

   String? email ;
   String? phone ;
   String? whatsNumber ;

   Data(this.email , this.phone , this.whatsNumber);

   Map<String , dynamic> toJson()
   {
     return
       {
         "email": email ,
         "phone":phone ,
         "WhatsApp_number":whatsNumber
     };
   }

   Data.FromJson(Map<String, dynamic>json)
   {
     email = json["email"];
     phone = json["phone"];
     whatsNumber = json["WhatsApp_number"];
   }

}