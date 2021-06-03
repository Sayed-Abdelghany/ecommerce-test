import 'package:badges/badges.dart';
import 'package:ecommerce_app/Model/Categories.dart';
import 'package:ecommerce_app/Providers/FavProvider.dart';
import 'package:ecommerce_app/Providers/ThemeProvider.dart';
import 'package:ecommerce_app/screens/CategoryScreen.dart';
import 'package:ecommerce_app/screens/ProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
  List<Product> Products = [
    Product( name:'Versace',image:'assets/images/p1.jpg',price:"700 LE",quantity: '3'),
    Product( name:'Namshi',image:'assets/images/p2.jpg',price:"650 LE",quantity: '4'),
    Product( name:'Adidas',image:'assets/images/p3.jpg',price:"450 LE",quantity: '8'),
    Product( name:'Zara',image:'assets/images/p4.jpg',price:"900 LE",quantity: '5'),
    Product( name:'Gucci',image:'assets/images/p5.jpg',price:"800 LE",quantity: '7'),
    Product( name:'Converse',image:'assets/images/p6.jpg',price:"500 LE",quantity: '2'),
    Product( name:'Lacoste',image:'assets/images/p7.jpg',price:"780 LE",quantity: '6'),
  ];
}
int selectedIndex = 0;
class _HomeScreenState extends State<HomeScreen> {
  var scafffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home,size: 35,),title: Text("Home")),
          BottomNavigationBarItem(icon:InkWell
            (onTap: (){
            Navigator.pushNamed(context, 'FavouriteScreen');
          },
              child: Icon(
                Icons.favorite,size: 35,)),title: Text("Favourite",
          ),
          ),
          BottomNavigationBarItem(icon:Icon(Icons.shopping_cart,size: 35,),title: Text("Card") ),
        ],
      ),
      key: scafffoldKey,
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:70 ,top: 10),
                child: FlatButton(
                    child: Text('change theme',style: TextStyle(fontSize: 20),),
                    onPressed: (){
                      Provider.of<ThemeProvider>(context,listen: false).changeTheme();
                    }
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding:const EdgeInsets.all(8.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    scafffoldKey.currentState.openDrawer();
                  },
                  child: Icon(Icons.list),
                ),
                Badge(
                    badgeContent: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 4,
                      child: Text('0'),
                    ),
                    position: BadgePosition(top: -3,end: -3),
                    child: Icon(Icons.shopping_cart,size: 30,)),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(15),
            child:Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200]
              ),
              child:TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.black,),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            height: height*.14,
            width: double.infinity,
            child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categories.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context){
                        return CategoryScreen(CategoryName: Categories[index]['name'],);
                      }
                      ));
                    },
                    child: Column(
                      children: [
                        Padding(padding: const EdgeInsets.all(10),
                          child: CircleAvatar(

                            radius: 30,
                            backgroundImage:AssetImage(Categories[index]['image']),
                          ),
                        ),
                        Text(Categories[index]['name'],style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 18),),
                      ],
                    ),
                    );

                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("New Arrival",style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
                Text("See All",style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
              ],
            ),
          ),
            Container(
                   height: height*.25,
                     width: double.infinity,
                  child: ListView.builder(
                  itemCount: Products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) {
                    return Consumer<FavouriteList>(
                      builder: (context,favList,child) {
                        for (var product in favList.favList) {
                          if (product == Products[index]) {
                            return InkWell(
                              onTap: () {
                                favList.removeProduct(Products[index]);
                                Provider.of<FavouriteList>(
                                    context, listen: false).removeProduct(
                                    Products[index]);
                              },
                              child: Badge(
                                badgeContent: Icon(Icons.favorite),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=> ProductDetails(product: Products[index])),
                                    );
                                  },

                                  child: Column(
                                    children: [
                                      Container(
                                        height: height * .18,
                                        width: height * .17,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                Products[index].image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(Products[index].name,
                                        style: TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.bold),),
                                      Text(Products[index].price,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.deepPurple),),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                        return InkWell(
                          onTap: () {
                            favList.addProduct(Products[index]);
                            Provider.of<FavouriteList>(
                                context, listen: false).addProduct(
                                Products[index]);
                          },
                          child: Badge(
                            badgeContent: Icon(Icons.favorite_border),
                            child: InkWell(
                              onTap: (){
                               Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> ProductDetails(product: Products[index])),
                              );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: height * .18,
                                    width: height * .17,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            Products[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  Text(
                                    Products[index].name, style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),),
                                  Text(
                                    Products[index].price, style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.deepPurple),),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }),
              ),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              child: Container(
                              height: height*.3,
                                child: Swiper(
                                 autoplay: true,
//                      pagination: SwiperPagination(),
                                      itemCount: 4,
                                    itemBuilder: (context,index){
                                    return Container(
                                    decoration: BoxDecoration(
                                   border: Border.all(color: Colors.grey),
                                   image: DecorationImage(
                                    fit: BoxFit.cover,
                                      image: AssetImage(animate[index]),
                                 ),
                               ),
                               );
                             }
                            ),
                          ),
                         ),
                         ]
                      ),
                    );
                 }
               }







