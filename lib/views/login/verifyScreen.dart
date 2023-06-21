import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:wasel/modules/register/app-cubitRegister.dart';
import 'package:wasel/modules/register/app-stateRegister.dart';
import 'package:wasel/shared/component.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'successScreen.dart';

class VerifyScreen extends StatefulWidget {
  late String? phoneNum ,  code ;


  VerifyScreen({Key? key , this.phoneNum , this.code}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> with SingleTickerProviderStateMixin {

  AnimationController? _animationController;
  int levelClock = 2 * 60;



  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));
       _listenSmsCode();

  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    _animationController?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {


    AppRegisterCubit cubit = AppRegisterCubit.get(context);

    cubit.VerifyCodeFunc(phone: widget.phoneNum, code: widget.code);


    return BlocConsumer< AppRegisterCubit, AppRegisterState>(
        listener: (context , state){

         if(state is VerifyCodeSuccessState )
          {

            showToast(msg: state.userVerifyModel?.msg ,
                state: ToastState.SUCCESS );


            Timer(
              const Duration(seconds: 3),
                  () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SuccessScreen()),
                    );
              },
            );


          }


         if(state is RESendCodeVerifySuccessState )
         {

           showToast(msg: state.verifyModel?.msg ,
               state: ToastState.SUCCESS );


              setState(() {
                widget.code = state.verifyModel?.code.toString() ;
              });

           cubit.VerifyCodeFunc(phone: widget.phoneNum, code: widget.code);


         }

        },
        builder: (context , state){

          return Scaffold(
            body: SafeArea(child:
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0 , vertical: 30),
                child: Column(
                  children: [
                    Image.asset('assets/images/Logo.png',
                      // width: 150,
                      width: MediaQuery.of(context).size.width ,
                      height: 150,),

                    Text(verify ,
                      textAlign: TextAlign.center , style: TextStyle(
                          fontWeight: FontWeightManager.regular ,
                          fontFamily: fontFamily ,
                          fontSize: FontSizeManager.s18 ,
                          color: defColor ), ),

                    Text(widget.phoneNum! ,style: TextStyle(
                        fontWeight: FontWeightManager.regular ,
                        fontFamily: fontFamily ,
                        fontSize: FontSizeManager.s18 ,
                        color: btnColor ),),

                    SizedBox(height: 20,),
                    Form(
                      // key: formKey,
                        child: Column(children: [

                        /*  VerificationCode(
                            textStyle: TextStyle(fontSize: 20.0, color: btnColor ),
                            keyboardType: TextInputType.number,
                            itemSize: 60,
                            underlineColor: gray ,
                            length: 4,
                            cursorColor: defColor ,
                            onCompleted: (String value) {
                              setState(() {
                                _code = value;
                                print('11111 '+ _code!);
                              });
                            },
                            onEditing: (bool value) {
                              setState(() {
                                _onEditing = value;

                              });
                              if (!_onEditing) FocusScope.of(context).unfocus();
                            },
                          ),*/


                          PinFieldAutoFill(
                            currentCode: widget.code,
                            codeLength: 4,
                            autoFocus: true,
                            decoration: UnderlineDecoration(
                              lineHeight: 2,
                              lineStrokeCap: StrokeCap.square,
                              bgColorBuilder: PinListenColorBuilder(
                                  Colors.grey.shade300 , Colors.grey.shade200),
                                 colorBuilder: const FixedColorBuilder(Colors.transparent),
                            ),
                          ),
                        ],)),

                    Padding(
                      padding: const EdgeInsets.only(top: 35.0, bottom: 60),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xff7EC242),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: MaterialButton(onPressed: ()async{

                          setState(() {

                            widget.code='' ;

                          });

                          _animationController!.forward();

                          // cubit.sendCodeVerify(phone: widget.phoneNum).
                          // then((value) {
                          //   setState(() {
                          //     widget.code= value.code.toString() ;
                          //
                          //   });
                          //
                          //   Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => SuccessScreen()),
                          //   );
                          //
                          // });
                          cubit.resendCodeVerify(phone: widget.phoneNum);

                        } , child: Text('Resend Code',
                          style: TextStyle(
                            color: Colors.white ,
                            fontWeight: FontWeightManager.semiBold ,
                            fontFamily: fontFamily ,
                            fontSize: FontSizeManager.s16 ,
                          ),  ),),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      children: [

                        Countdown(
                          animation: StepTween(
                            begin: levelClock, // THIS IS A USER ENTERED NUMBER
                            end: 0,
                          ).animate(_animationController!),
                        ),

                        Text("Resend code after: "),


                      ],),

                  ],),
              ),
            )),
          );

        },
      );
  }
}



/*
class VerifyScreen extends StatefulWidget {
  final String? phoneNum ;
   VerifyScreen({Key? key, this.phoneNum} ) : super(key: key);

  @override
  State<VerifyScreen> createState() => VerifyScreenState();
}

class VerifyScreenState extends State<VerifyScreen>
    with SingleTickerProviderStateMixin {

  AnimationController? _animationController;
  int levelClock = 2 * 60;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));

    _animationController!.forward();

    _listenSmsCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    _animationController!.dispose();
    super.dispose();
  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F4FD),
      appBar: AppBar(
        title: const Text("SMS OTP AutoFill"),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text("Verification"),
                  Text(
                    "We sent you a SMS Code",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "On number: +998993727053",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Center(
              child: PinFieldAutoFill(
                codeLength: 4,
                autoFocus: true,
                decoration: UnderlineDecoration(
                  lineHeight: 2,
                  lineStrokeCap: StrokeCap.square,
                  bgColorBuilder: PinListenColorBuilder(
                      Colors.green.shade200, Colors.grey.shade200),
                  colorBuilder: const FixedColorBuilder(Colors.transparent),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Resend code after: "),
                Countdown(
                  animation: StepTween(
                    begin: levelClock, // THIS IS A USER ENTERED NUMBER
                    end: 0,
                  ).animate(_animationController!),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 56,
            width: 200,
            child: ElevatedButton(
              onPressed: () async {
                //?  use this code to get sms signature for your app
                // final String signature = await SmsAutoFill().getAppSignature;
                // print("Signature: $signature");

                _animationController!.reset();
                _animationController!.forward();
              },
              child: const Text("Resend"),
            ),
          ),
          SizedBox(
            height: 56,
            width: 200,
            child: ElevatedButton(
              onPressed:  () async{
                //Confirm and Navigate to Home Page
                final String signature = await SmsAutoFill().getAppSignature;
                print("Signature: $signature");
              } ,
              child: const Text("Confirm"),
            ),
          ),
        ],
      ),
    );
  }
}

*/




class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    return Text(
      timerText,
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}