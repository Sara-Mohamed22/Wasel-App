import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/modules/login/app-stateLogin.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:wasel/views/contact-us-screen/contactScreen.dart';
import 'package:wasel/views/favorit/favoritScreen.dart';
import 'package:wasel/views/location/locationScreen.dart';
import 'package:wasel/views/login/editDataScreen.dart';
import 'package:wasel/views/login/loginScreen1.dart';
import 'package:wasel/views/login/loginScreen2.dart';
import 'package:wasel/views/orders/orderScreen.dart';
import 'package:wasel/views/payment/payment.dart';
import 'package:wasel/views/suggestion/suggestScreen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    AppCubit cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit ,AppState>(
      listener:(context , state){


      } ,
      builder:(context , state){

        print('pppppp ${CashHelper.getData(key: 'name')}');
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              title: Text('Profile' , style: TextStyle(
                  fontSize: FontSizeManager.s15 ,
                  fontWeight: FontWeightManager.semiBold
              ),),
              centerTitle: true,

            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                  children:
                  [
                     Card(

                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0),
                       ),

                       elevation: 3,

                       child: Stack(

                         alignment: AlignmentDirectional.topEnd,
                         clipBehavior: Clip.antiAlias ,

                         children: [
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 20.0),

                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround ,
                               children:
                               [
                                 CircleAvatar(
                                   radius:30 ,
                                   backgroundImage:
                                   NetworkImage('${CashHelper.getData(key: 'avater')}'),

                                 ),



                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children:
                                   [
                                     createString(
                                         title: '${CashHelper.getData(key: 'name')}',
                                         color: defColor ,
                                         weight: FontWeightManager.semiBold ,
                                         fontSize: 15
                                     ),

                                     createString(
                                         title: '${CashHelper.getData(key: 'email')}',
                                         color: btnColor ,
                                         weight: FontWeightManager.semiBold ,
                                         fontSize: 14
                                     ),

                                     createString(
                                         title: '${CashHelper.getData(key: 'phone')}',
                                         color: btnColor ,
                                         weight: FontWeightManager.semiBold ,
                                         fontSize: 14
                                     ),
                                   ],
                                 ),

                                 SizedBox(width:20),

                               ],
                             ),
                           ),
                           InkWell(
                             onTap: (){
                               print('edit');
                            navTo(context, EditDataScreen());

                             },
                             child: Container(


                                 width: 40,
                                 height: 40,
                                 decoration: BoxDecoration(
                                     color: btnColor,
                                     // border: Border.all(),
                                     borderRadius: BorderRadius.only(
                                         topRight: Radius.circular(10)
                                     )

                                 ),
                                 child: Icon(Icons.edit,color: Colors.white, )),
                           ),

                         ],

                       ),
                     ),
                    Card(
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),

                        child: Column(
                          children:
                          [

                           Row(
                             children: [

                               SvgPicture.asset('assets/images/sv1.svg'),


                               SizedBox(width: 15,),

                               createString(
                                 title: 'Orders',
                                 color: defColor ,
                                 weight: FontWeightManager.regular ,
                                 fontSize: 15
                                   ),

                               Spacer(),

                               InkWell(
                                 child: Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),
                                 onTap: (){
                                 print('arrowww');
                                 Navigator.push(context,
                                   MaterialPageRoute(builder: (context) => OrderScreen()),
                                 );
                                 },
                               ),


                             ],),
                            SizedBox(height: 10,),
                            Divider(color: Colors.grey.shade200, thickness: 2,),

                            Row(
                              children: [

                                SvgPicture.asset('assets/images/sv2.svg'),


                                SizedBox(width: 15,),

                                createString(
                                    title: 'Delivery Address',
                                    color: defColor ,
                                    weight: FontWeightManager.regular ,
                                    fontSize: 15
                                ),

                                Spacer(),

                                InkWell(
                                  child: Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),
                                  onTap: (){
                                    print('arrowww');

                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => LocationScreen()),
                                    );

                                  },
                                ),


                              ],),
                            SizedBox(height: 10,),
                            Divider(color: Colors.grey.shade200, thickness: 2,),

                            Row(
                              children: [

                                SvgPicture.asset('assets/images/sv3.svg'),


                                SizedBox(width: 15,),

                                createString(
                                    title: 'Payments',
                                    color: defColor ,
                                    weight: FontWeightManager.regular ,
                                    fontSize: 15
                                ),

                                Spacer(),

                                InkWell(
                                  child: Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),
                                  onTap: (){

                                    print('arrowww');
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => PaymentScreen()),
                                    );
                                  },
                                ),


                              ],),
                            SizedBox(height: 10,),
                            Divider(color: Colors.grey.shade200, thickness: 2,),

                            Row(
                              children: [

                                // SvgPicture.asset('assets/images/sv1.svg'),

                                Icon(Icons.favorite_border, color: btnColor ,size: 30 ,),

                                SizedBox(width: 15,),

                                createString(
                                    title: 'Favorites',
                                    color: defColor ,
                                    weight: FontWeightManager.regular ,
                                    fontSize: 15
                                ),

                                Spacer(),

                                InkWell(
                                  child: Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),
                                  onTap: (){

                                    Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => FavoritScreen()),
                                    );

                                  },
                                ),


                              ],),

                            SizedBox(height: 10,),
                            Divider(color: Colors.grey.shade200, thickness: 2,),
                            Row(
                              children: [

                                Image.asset('assets/images/sug.jpg', width: 40, height: 40,),


                                SizedBox(width: 15,),

                                createString(
                                    title: 'Add Suggestion',
                                    color: defColor ,
                                    weight: FontWeightManager.regular ,
                                    fontSize: 15
                                ),

                                Spacer(),

                                InkWell(
                                  child: Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),
                                  onTap: (){
                                    print('arrowww');

                                    Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => SuggestScreen()),
                                    );
                                  },
                                ),


                              ],),

                            SizedBox(height: 10,),
                            Divider(color: Colors.grey.shade200, thickness: 2,),
                            Row(
                              children: [

                                Image.asset('assets/images/lang.jpg', width: 40, height: 40,),


                                SizedBox(width: 15,),

                                createString(
                                    title: 'Language',
                                    color: defColor ,
                                    weight: FontWeightManager.regular ,
                                    fontSize: 15
                                ),

                                Spacer(),

                                InkWell(
                                  // child: Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('${cubit.langg}' , style: TextStyle(
                                        fontWeight: FontWeight.w500 ,
                                        color: Colors.grey.shade600 ),),
                                  ),

                                  onTap: ()async{

                                  await   showModalBottomSheet(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(10.0),
                                           ),
                                          context: context,
                                          builder: (BuildContext context){



                                            return Container(
                                              height: 180,
                                              width: double.maxFinite,
                                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                                              child: ListView.separated(
                                                  shrinkWrap: true,
                                                  physics: BouncingScrollPhysics(),
                                                  itemBuilder: (context,index){

                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                      child: GestureDetector(child:
                                                      Text(cubit.locale[index]['name']),
                                                        onTap: (){

                                                        print(cubit.locale[index]['name']);

                                                          cubit.updateLanguage(
                                                          cubit.locale[index]['locale'] ,
                                                            cubit.locale[index]['name']);

                                                          Navigator.pop(context);

                                                      },),
                                                    );
                                                  },

                                                  separatorBuilder: (context,index)=> SizedBox(height: 5,),
                                                  itemCount: cubit.locale.length
                                              ),
                                            );



                                          })
                                ;
                                  },
                                ),


                              ],),

                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),

                    Card(
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),

                        child: Column(
                          children:
                          [

                            Row(
                              children: [

                                SvgPicture.asset('assets/images/sv4.svg'),


                                SizedBox(width: 15,),

                                createString(
                                    title: 'Contacts Us',
                                    color: defColor ,
                                    weight: FontWeightManager.regular ,
                                    fontSize: 15
                                ),

                                Spacer(),

                                InkWell(
                                  child: Icon(Icons.arrow_forward_ios_outlined, color: btnColor, ),
                                  onTap: (){
                                    print('arrowww');
                                    Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => ContactScreen()),
                                    );
                                  },
                                ),


                              ],),


                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),

                    Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: MaterialButton(onPressed: (){

                        CashHelper.removeData(key: 'token').then((value) {

                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginScreen1()),
                          );

                        });

                        print('logout');

                      } , child: Text('Logout',
                        style: TextStyle(
                          color: Colors.white ,
                          fontWeight: FontWeightManager.semiBold ,
                          fontFamily: fontFamily ,
                          fontSize: FontSizeManager.s15 ,
                        ),  ),),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar:
            BottomNavigationBar(


              selectedItemColor: btnColor,

              currentIndex: cubit.currentIndex ,
              type: BottomNavigationBarType.fixed ,

              items: [

                BottomNavigationBarItem(icon:
                Column(
                  children: [
                    Container(

                      child: Image.asset('assets/images/home.png', color: cubit.unselectNavBar , ),
                      width: 28,
                      height: 28,
                    ),
                    Text('Home'.tr , style: TextStyle(color: gray),)

                  ],

                ) ,
                  label: '', ),

                BottomNavigationBarItem(icon:
                Column(
                  children: [
                    Container(

                      child: Image.asset('assets/images/search.png',color: cubit.unselectNavBar , ),
                      width: 28,
                      height: 28,
                    ),
                    Text('Search'.tr , style: TextStyle(color: gray),)
                  ],
                ) ,

                  label: '' ,),


                BottomNavigationBarItem(icon:
                Stack(
                  alignment: Alignment.topRight,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/category.png' ,color: cubit.unselectNavBar , ),
                            width: 28 ,
                            height: 28 ,
                          ),
                          Text('Category'.tr , style: TextStyle(color: gray , fontSize: 12), )
                        ],
                      ),
                    ),

                    /*  CircleAvatar(radius: 10,
                      backgroundColor: btnColor,
                        child: Text('3' , style: TextStyle(color: Colors.white),),
                      )*/


                  ],
                ), label: '',),

                BottomNavigationBarItem(icon:
                Stack(
                  alignment: Alignment.topRight,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/cart.png' , color: cubit.unselectNavBar ,),
                            width: 28 ,
                            height: 28 ,
                          ),
                          Text('Cart'.tr , style: TextStyle(color: gray),)

                        ],
                      ),
                    ),

                    CircleAvatar(radius: 10,
                      backgroundColor: defColor,
                      child:

                      CashHelper.getData(key: 'notificationNum') !=null ?
                      Text('${CashHelper.getData(key: 'notificationNum')}'   , style: TextStyle(color: Colors.white),):
                      Text('0'   , style: TextStyle(color: Colors.white),),

                    )


                  ],
                ), label: '',),

                BottomNavigationBarItem(icon:
                Stack(
                  alignment: Alignment.topRight,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/profile.png' ,color: cubit.selectNavBar , ),
                            width: 28 ,
                            height: 28 ,
                          ),
                          Text('Profile'.tr , style: TextStyle(color: btnColor),)

                        ],
                      ),
                    ),




                  ],
                ), label: '',),

              ],
              elevation: 5,


              onTap: (index)
              {
                print('indexxxx $index');

                cubit.changeBottomNav(index);

                navTo(context, cubit.screens[index]);

              },

            )
        );
      } ,
    );
  }
}


