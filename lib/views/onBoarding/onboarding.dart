import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:wasel/views/login/loginScreen1.dart';


class BoardingModel
{
  final String? image ;
  final String? title ;
  final String? subtitle ;

  BoardingModel({@required this.image, @required this.title , @required this.subtitle });
}




class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding =[

    BoardingModel(
        image: 'assets/images/onboard1.png' ,
        title: 'واصل للبيت مجانا' ,
      subtitle: 'عروض ضخمة'
    ) ,
    BoardingModel(
        image: 'assets/images/onboard2.png' ,
        title: 'حدد موعد الاستلام' ,
        subtitle: 'تعقب تحركات طلبك'

    ) ,
    BoardingModel(
        image: 'assets/images/onboard3.png' ,
        title: 'الدفع على الباب' ,
        subtitle: 'والاعادة بابتسامة'

    ) ,


  ] ;

  bool  isLast = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight( MediaQuery.of(context).size.height/12 ),

        child: AppBar(



          title: SmoothPageIndicator(
            controller: boardController ,
            count: boarding.length ,
            effect: ScrollingDotsEffect(
                dotColor: Colors.white ,
                activeDotColor: Color(0xff7EC242) ,
                dotHeight: 10,
                dotWidth: 10 ,
                spacing: 8.0
            ),


          ),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),

        child: Column(
          children: [


            Expanded(
              child: PageView.builder(

                controller: boardController ,
                onPageChanged: (int index)
                {
                  if(index == boarding.length-1)
                  {
                    print('last');
                    setState(() {
                      isLast = true ;
                    });
                  }
                  else
                  {
                    print(' not last');

                    setState(() {
                      isLast= false;
                    });
                  }
                },
                physics: BouncingScrollPhysics() ,
                itemBuilder: (context , index)=> buildBoardingItem(boarding[index]),
                itemCount: boarding.length ,

              ),
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20),
              child: Row(
                children: [

                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xff7EC242),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: MaterialButton(onPressed: (){
                      if(isLast==true)
                      {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginScreen1()),
                        );
                      }
                      else
                      {
                        boardController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }

                    } , child: Text('التالى',
                      style: TextStyle(color: Colors.white , fontSize: 16
                      ),  ),),
                  ),

                  Spacer(),

                  TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen1() ));
                  }, child: Text('تخطى' ,
                    style: TextStyle(color: Color(0xFF8097B8), fontSize: 16
                  ),)) ,


                ],
              ),
            )

          ],
        ),
      ) ,


    );
  }

  Widget buildBoardingItem(BoardingModel model)=> SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(

          child: Stack(

            children: [

              Image.asset('assets/images/bk2.png' ,
                width: MediaQuery.of(context).size.width,
                // height: 220,
                height: MediaQuery.of(context).size.height*.4,
                fit: BoxFit.fill ,),

              Image.asset('assets/images/bk1.png' ,  width:MediaQuery.of(context).size.width,
                  // height: 200,
                  height: MediaQuery.of(context).size.height*.3,
                  fit: BoxFit.fill ),


              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height /8),
                child: Center(child: Image.asset('${model.image}' ,
                  // height: 200,
                  // width: 200,
                 width:MediaQuery.of(context).size.width/1.8 ,
                  // height:MediaQuery.of(context).size.height*.7
                  // ,
                )),
              ),


            ],
          ),
        ),
        SizedBox(height: 25,),
        Text(
          '${model.title}' ,
          style: TextStyle(
              fontSize: FontSizeManager.s20 ,
            fontFamily: fontFamily ,
            fontWeight: FontWeightManager.semiBold
          ),
        ),
        SizedBox(height: 10,),
        Text(
          '${model.subtitle}' ,
          style: TextStyle(
              fontSize: FontSizeManager.s18 ,
              fontFamily: fontFamily ,
              fontWeight: FontWeightManager.light
          ),
        ),

      ],
    ),
  );
}