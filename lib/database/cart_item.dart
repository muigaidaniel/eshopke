import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemNotifier with ChangeNotifier{
  List<CartItem> _cart_item_list= [];
  CartItem _currentCartItem;
  UnmodifiableListView<CartItem> get cart_item_list=> UnmodifiableListView(_cart_item_list);
  CartItem get currentItem => _currentCartItem;

  set cart_item_list(List<CartItem> cart_item_list){
    _cart_item_list= cart_item_list;
    notifyListeners();
  }
  set currentCartItem(CartItem cartItem){
    _currentCartItem= cartItem;
    notifyListeners();
  }
}

class CartItem{
  String id;
  String itemname;
  String picture;
  String price;
  String description;
  String quantity;

  CartItem.fromMap(Map<String, dynamic>data){
    itemname=data['name'];
    price=data['price'];
    picture=data['picture'];
    quantity=data['quantity'];
  }

}

getCartItems(CartItemNotifier cartItemNotifier)async{
  QuerySnapshot snapshot= await FirebaseFirestore.instance.collection('cart').get();
  List<CartItem> _cart_item_list=[];
  snapshot.docs.forEach((doc) {
    CartItem cartItem= CartItem.fromMap(doc.data());
    _cart_item_list.add(cartItem);
  });
  cartItemNotifier.cart_item_list=_cart_item_list;

}