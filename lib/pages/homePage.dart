import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:home_page_crypto/services/data_CryptoCurrency.dart';
class Home extends StatefulWidget {

  _HomeState createState() => _HomeState();
}

        class _HomeState extends State<Home> {
          @override
          void initState() {
    // TODO: implement initState
    super.initState();
  }
          _HomeState () {

          }
          Map data={
          };


            // ignore: file_names

var instace;
  @override
        Widget build(BuildContext context) {
    instace= ((ModalRoute.of(context)!.settings.arguments ) as Map).isNotEmpty;



          return Scaffold(
            appBar: AppBar(
              title: Text('Home Page '),
              centerTitle: true,
              elevation: 0.0,
            ),





      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
      child:Column(
       mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              color: Colors.amber,
              minWidth: 50.0,
              height: 50.0,
              child: Text('navigate to cryptocurrency list'),
              onPressed: ()  {
                Navigator.pushNamed(context, 'CryptoCurrencyList'
                );
              },

            ),

          ),
          /*if(subscribed_data!=null){
          (Text('${subscribed_data ["Bitcoinprice_in_USD"]}')),
          }*/
          // ignore: file_names

          
         // if (data.isNotEmpty) (Text('${data ["hi"]}')) ,

              ],
            ),
    )
    );
  }
}
