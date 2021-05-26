import 'package:flutter/material.dart';
import 'package:home_page_crypto/pages/cryptocurrencyList.dart';
import 'package:home_page_crypto/pages/homePage.dart';
import 'package:home_page_crypto/pages/subscribeUnsubscribePage.dart';

void main()=>runApp(
  MaterialApp(
    home: Home() ,
    debugShowCheckedModeBanner: false,
    initialRoute: 'HomePage',
    routes: {

      'HomePage':(context)=>Home(),
      'CryptoCurrencyList':(context)=>CryptoCurrencyList(),
      'SubscribeUnsubscribe':(context)=>SubscribeUnsubscribe(),
    }
  ),
);




