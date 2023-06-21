class VerifyModel
{
  int? code ;
  String? msg ;
  VerifyModel(this.code , this.msg);


  Map<String , dynamic> toJson()
  {
    return
      {
        "code": code ,
        "message": msg
      };
  }

  VerifyModel.FromJson(Map<String, dynamic> json)
  {
    code = json["code"];
    msg = json["message"];
  }

}


