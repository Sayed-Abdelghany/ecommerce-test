import 'package:ecommerce_app/Service/AuthFile.dart';
import 'package:ecommerce_app/screens/HomeScreen.dart';
import 'package:ecommerce_app/screens/LoginScreen.dart';
import 'package:ecommerce_app/widget/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SignupScreen extends StatefulWidget {
  static String id = 'SignupScreen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var signUpKey = GlobalKey<FormState>();
  var auth = AuthClass();
  String name,email,pass,confirmPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 980,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mv.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:ListView(
          children: [
            SizedBox(height: 80,),
            Icon(FontAwesomeIcons.ggCircle,size: 100,color: Colors.red,),
            SizedBox(height: 50,),

            Form(
              key: signUpKey,
              child: Column(
                children: [
                  CustomTextField(hint: ' Enter your Username',
                    onSaved: (value){
                    name = value;
                    },
                    validator: (value){
                    if (value.toString().isEmpty){
                      return 'Please Enter Name';
                    }
                    },
                    iconData: Icons.person,secure: false,),
                ],
              ),
            ),
            SizedBox(height: 30,),
            CustomTextField(hint: 'Enter your Email',
              onSaved: (value){
                email = value;
              },
              validator: (value){
                if (value.toString().isEmpty){
                  return 'Please Enter Email';
                }
              },
              iconData: Icons.mail,secure: false,),
            SizedBox(height:30),
            CustomTextField(hint: 'Enter Password',
              onSaved: (value){
                pass = value;
              },
              validator: (value){
                if (value.toString().isEmpty){
                  return 'Please Enter Password';
                }
              },
              iconData: Icons.lock,secure: true,),
            SizedBox(height: 30,),
            CustomTextField(
              hint: 'Confirm Password',
              onSaved: (value){
                confirmPass = value;
              },
              validator: (value){
                if (value.toString().isEmpty){
                  return 'Please Re-Enter Password';
                }
              },
              iconData: Icons.lock,secure: true,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100,vertical: 30),
              child:InkWell(
              onTap: ()async{
                try{
              signUpKey.currentState.save();
              if (signUpKey.currentState.validate()){
              await  auth.signUp(email, pass);
              Navigator.pushNamed(context, HomeScreen.id);
              }else
                 {
                 print('CompleteData');
                }
              }catch(e)
                {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                }
                },
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text('SIGN UP',style: TextStyle(
                        color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have account ?',style: TextStyle(fontSize: 20,color: Colors.purple),),
                  FlatButton(
                    child: Text('SIGN IN',style: TextStyle(color: Colors.grey,fontSize: 25),),
                    onPressed: (){
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
