import 'package:ecommerce_app/Providers/FavProvider.dart';
import 'package:ecommerce_app/Providers/ThemeProvider.dart';
import 'package:ecommerce_app/screens/CategoryScreen.dart';
import 'package:ecommerce_app/screens/FavouriteScreen.dart';
import 'package:ecommerce_app/screens/HomeScreen.dart';
import 'package:ecommerce_app/screens/LoginScreen.dart';
import 'package:ecommerce_app/screens/ProductDetails.dart';
import 'package:ecommerce_app/screens/SignupScreen.dart';
import 'package:ecommerce_app/screens/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Constants/Theme.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ThemeProvider()),
        ChangeNotifierProvider(create: (context)=>FavouriteList()),
      ],
        child: MyApp())
);
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<ThemeProvider>(context).isLight ==true?lightMode: darkMode,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id:(context)=> LoginScreen(),
          SignupScreen.id:(context)=> SignupScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          CategoryScreen.id: (context) => CategoryScreen(),
          ProductDetails.id: (context) => ProductDetails(),
          FavouriteScreen.id:(context)=> FavouriteScreen(),
        }
    );
  }
}
