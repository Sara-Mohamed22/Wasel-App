// local class

class CartModel
{
  int? id ;
  dynamic price ;
  int? quantity ;
  CartModel(this.id , this.price , this.quantity);

  Map<String,dynamic> toJson()
  {
    return
      {
       'id':id ,
        'price':price ,
        'quantity' : quantity
      };
  }

  CartModel.FromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];

  }

}