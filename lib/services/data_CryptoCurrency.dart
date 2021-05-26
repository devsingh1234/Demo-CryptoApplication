
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class currency {
  String url_data;
  String currency_pic;
  String currency_name;
  var price_in_USD;
  var price_in_INR;
  var marketCapUsd;
  var maxSupply;
  var volumeUsd24Hr;
  var changePercent24Hr;
  var vwap24Hr;

  currency({required this.url_data,required this.currency_pic,required this.currency_name});



  Future<void> getData() async {
    try {
      var url = Uri.parse("https://api.coincap.io/v2/assets/$url_data");
      Response response = await get(url);
      Map data = jsonDecode(response.body);
      Map data1 = data["data"];
      price_in_USD=double.parse(double.parse(data1["priceUsd"] ).toStringAsFixed(3));
      price_in_INR = double.parse((double.parse(data1["priceUsd"] )* 72.91).toStringAsFixed(3)) ;
      marketCapUsd=data1["marketCapUsd"];
      maxSupply=data1["maxSupply"];
      volumeUsd24Hr=data1["volumeUsd24Hr"];
        changePercent24Hr=data1["changePercent24Hr"];
      vwap24Hr=data1["vwap24Hr"];


    }

    catch (e) {
     price_in_INR='error';
     price_in_USD='error';
      print(e);





    }
  }

  }