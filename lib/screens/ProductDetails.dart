import 'package:ecommerce_app/Model/Categories.dart';
import 'package:ecommerce_app/Model/Categories.dart';
import 'package:ecommerce_app/Model/product.dart';
import 'package:flutter/material.dart';
class ProductDetails extends StatefulWidget {
  static String id ='ProductDetails';
  Product product ;
  ProductDetails( { this.product});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();

}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Container(
        child: ListView(
          children: [
         Container(
           height: height*.4,
           width: double.infinity,
           decoration: BoxDecoration(
             border: Border.all(color: Colors.grey,width: 2),
             image: DecorationImage(
                 image: AssetImage(widget.product.image),

               fit: BoxFit.cover,
             ),
           ),
         ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Icon(Icons.favorite_border,color: Colors.red,size: 40,)
                ],
              ),
            ),
            Text('adidas running',style: TextStyle(fontSize: 30),),
            SizedBox(height: height*.03,),
            Text('High Quality Clothes foe Men and Made effectively from best Materials from best brands this The best to Choose and keep your style good',
              style: TextStyle(fontSize: 22),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(child: IconButton(icon:Icon(Icons.add), onPressed: (){}),),
                  SizedBox(width: height*0.01,),
                  Text(widget.product.quantity,style: TextStyle(fontSize: 20),),
                  SizedBox(width: height*0.01,),
                  CircleAvatar(child: IconButton(icon:Icon(Icons.remove), onPressed: (){}),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.price,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Container(
                    height: height*.06,
                    width: height*.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Icon(Icons.add,color: Colors.white,),
                          SizedBox(width: height*0.04,),
                          Text('Add to Cart',style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),
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
