import 'package:ecommerce_app/Model/Categories.dart';
import 'package:flutter/material.dart';

class FavouriteList extends ChangeNotifier
{
  List<Product>favList =[];
  addProduct(product){
    favList.add(product);
    notifyListeners();
  }
  removeProduct(product){
    favList.remove(product);
    notifyListeners();
  }
}