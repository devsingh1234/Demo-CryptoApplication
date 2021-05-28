import 'package:flutter/material.dart';
import 'package:home_page_crypto/pages/cryptocurrencyList.dart';
import 'package:home_page_crypto/pages/homePage.dart';
import 'package:home_page_crypto/pages/loadingPage.dart';
import 'package:home_page_crypto/pages/loginPage.dart';
import 'package:home_page_crypto/pages/detailsCryptoCurrency.dart';

void main()=>runApp(
  MaterialApp(
    home: Home() ,
    debugShowCheckedModeBanner: false,
    initialRoute: 'LoadingPage',
    routes: {
      'LoadingPage':(context)=>LoadingPage(),
      'LoginPage':(context)=>LoginPage(),
      'HomePage':(context)=>Home(),
      'CryptoCurrencyList':(context)=>CryptoCurrencyList(),
      'DetailsCryptocurrency':(context)=>DetailsCryptocurrency(),
    }
  ),
);




