import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class SqflitDB
{

  static Database? _db ;

 Future<Database?> get db async
  {
    if(_db == null)
      {
        return _db = await initalDb()  ;

      }
    else
      {
        return _db ;
      }

  }

  initalDb()async
  {
    // get path to database
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'products.db');
    Database mydb = await openDatabase(path , onCreate: _onCreate , version: 1 , onUpgrade: _onUpgrade  );

   return mydb ;
  }


  // create table
  _onCreate(Database db , int varsion)async
  {

   await db.execute(
   
           " CREATE TABLE products ( "
           "id  INTEGER  PRIMARY KEY ,"
           "name VARCHAR(200) ,description TEXT ,"
           "miniDescription TEXT ,price REAL ,"
           "oldPrice REAL,weight TEXT,"
          ' weightUnit TEXT,stock INTEGER, '
           'stockType TEXT,'
           'canBuy BOOLEAN,'
           'code TEXT,'
           'isFavored BOOLEAN,'
           'images DYNAMIC,'
           'defaultImage OBJECT,'
           'customFields DYNAMIC ,'
           'availableOffer OBJECT ,'
           'textOptions DYNAMIC ,'
           'selectOptions DYNAMIC ,'
           'initalQuantity INTEGER ,)'
          
       ).then((value) => print('create Database And Tables..') ).catchError((e){
         print('insert error ${e.toString()}');
   });



  }


  _onUpgrade(Database db , int oldVersion , int newVersion )
  {
  }


  //readDb
 Future readDb(String sql)async
  {
    Database? mydb = await db ;
    var response = await mydb?.rawQuery('SELECT * FROM $sql ');

    return response ;
  }


  insertDb({
    int? id,
    String? name ,
    String? description,
    String? miniDescription,
    dynamic price,
    dynamic oldPrice,
    String? weight,
    String? weightUnit,
    int? stock,
    String? stockType,
    bool? canBuy,
    String? code,
    bool? isFavored ,
    dynamic images,
    dynamic defaultImage,
    dynamic customFields,
    dynamic availableOffer,
    List<dynamic>? textOptions,
    List<dynamic>? selectOptions,
    int? initalQuantity  ,


  })async
  {
    Database? mydb = await db ;
    await mydb?.rawInsert(
     'INSERT INTO products (id,name,description,miniDescription'
         ',price,oldPrice,weight,'
         'weightUnit,stock,'
         'stockType,canBuy,'
         'code,isFavored'
         ',images,defaultImage,customFields'
         ' ,availableOffer,textOptions,'
         'selectOptions,initalQuantity)'
         ' VALUES('
         '$id,$name,$description,'
         '$miniDescription,$price,$oldPrice,'
         '$weight,$weightUnit,'
         '$stock,$stockType,$canBuy,$code,'
         '$isFavored,$images,$defaultImage,'
         '$customFields,'
         '$availableOffer,$textOptions,'
         '$selectOptions,$initalQuantity ) ',

       ).
  then((value) {
    print('inserttt $value');
  }).
  catchError((e){
    print(e.toString());
  });
 }






}


