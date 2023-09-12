

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';

import 'sugestScreen2.dart';

class SuggestScreen extends StatelessWidget {
  SuggestScreen({Key? key}) : super(key: key);

  TextEditingController namePro = TextEditingController();
  TextEditingController descPro = TextEditingController();

 var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {



    AppCubit cubit = AppCubit.get(context);

    return  BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder: (context , state){
        return  Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              title: Text('Add Suggestion' , style: TextStyle(
                  fontSize: FontSizeManager.s15 ,
                  fontWeight: FontWeightManager.semiBold
              ),),
              centerTitle: true,

            ),

            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 30),

                child: Column(


                  children:
                  [
                  createString(
                      title: 'Enter Suggested Product Name and Description',
                      color: defColor ,
                      line: 2


                  ),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text ,
                            controller: namePro ,
                            validator: (val)=> val!.isEmpty ? 'Enter This Filed' : null ,

                            textAlign: TextAlign.center,

                            onChanged: (val){
                            },
                            decoration: InputDecoration(



                              fillColor: Colors.grey,

                              hintText: "Product Name",

                              //make hint text
                              hintStyle: TextStyle(

                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),



                            ),
                          ),

                          SizedBox(height: 40,),

                          TextFormField(
                            keyboardType: TextInputType.text ,
                            controller: descPro ,
                            textAlign: TextAlign.center,
                           // validator: (val)=> val!.isEmpty ? 'Enter This Filed' : null ,
                           maxLines: 5,

                            onChanged: (val){
                            },
                            decoration: InputDecoration(




                              fillColor: Colors.grey,

                              hintText: "Product Description",

                              //make hint text
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),



                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30,),

                       ConditionalBuilder(
                      condition: state is !ADDSUggestionLoadingState ,
                      builder: (context)=> Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        height: 40,
                        decoration: BoxDecoration(
                            color: btnColor ,
                            // border: Border.all(),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: MaterialButton(onPressed: (){

                          if(_formKey.currentState!.validate() ) {

                            cubit.addSuggestion(name: namePro.text , desc: descPro.text );

                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => Suggest2Screen()),
                            );

                            print('send');
                          }

                        } , child: Text('Send',
                          style: TextStyle(
                            color: Colors.white ,
                            fontWeight: FontWeightManager.semiBold ,
                            fontFamily: fontFamily ,
                            fontSize: FontSizeManager.s15 ,
                          ),  ),),
                      ) ,
                      fallback: (context)=>  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),

                        child: CircularProgressIndicator(),
                      ),
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
                            child: Image.asset('assets/images/profile.png' ,color: cubit.unselectNavBar , ),
                            width: 28 ,
                            height: 28 ,
                          ),
                          Text('Profile'.tr , style: TextStyle(color: gray),)

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
      },
    );
  }
}
