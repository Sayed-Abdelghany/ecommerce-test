import 'dart:async';
import 'package:ecommerce_app/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.popAndPushNamed(context, LoginScreen.id);
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        skip: Text("skip",style: TextStyle(fontSize: 20,color: Colors.white),),
        done: Text("done",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        next: Icon(Icons.arrow_forward,size: 30,color: Colors.white,),
        showNextButton: true,
        showSkipButton: true,
        onDone: (){
          Navigator.popAndPushNamed(context,LoginScreen.id);
        },
        pages: [
          PageViewModel(

            decoration: PageDecoration(
              boxDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ws.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            titleWidget: Text("",style: TextStyle(color: Colors.white),),
            body: '',
          ),
          PageViewModel(

            decoration: PageDecoration(
              boxDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/wq.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            titleWidget: Text("",style: TextStyle(color: Colors.white),),
            body: '',
          ),
        ],
      ),
    );
  }
}
