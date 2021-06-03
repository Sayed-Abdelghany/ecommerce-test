import 'package:ecommerce_app/screens/HomeScreen.dart';
import 'package:ecommerce_app/screens/SignupScreen.dart';
import 'package:ecommerce_app/widget/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        height: 950,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cl.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:ListView(
          children: [
            SizedBox(height: 80,),
//            Image.asset('assets/images/eea.jpg'),
            Icon(FontAwesomeIcons.ggCircle,size: 100,color: Colors.red,),
            SizedBox(height: 100,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('User  Login',style: TextStyle(
                  color: Colors.blueGrey,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            CustomTextField(hint: 'Username',iconData: Icons.person,secure: false,),
            SizedBox(height: 20,),
            CustomTextField(hint: 'Password',iconData: Icons.lock,secure: true,),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New User?',style: TextStyle(fontSize:25,color: Colors.purple)),
                FlatButton(
                    child: Text('Sign Up',style: TextStyle(
                        color: Colors.white,fontSize: 20),),
                    onPressed: (){
                      Navigator.pushNamed(context,SignupScreen.id);
                    }
                ),
              ],
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child:InkWell(
                onTap: (){
                  Navigator.pushNamed(context,HomeScreen.id );
                },
                child: Container(
                  child: Center(
                    child: Text('LOGIN',style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                ),
              ),

            ),
          ],
        ),
      ),

    );
  }
}
