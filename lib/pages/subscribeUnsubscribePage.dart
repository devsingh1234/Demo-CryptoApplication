import 'package:flutter/material.dart';
import 'package:home_page_crypto/main.dart';
import 'homePage.dart';

class SubscribeUnsubscribe extends StatefulWidget {

  @override
  _SubscribeUnsubscribeState createState() => _SubscribeUnsubscribeState();
}

class _SubscribeUnsubscribeState extends State<SubscribeUnsubscribe> {

  Map currency_tapped_data={};
  @override
  Widget build(BuildContext context) {
    currency_tapped_data=ModalRoute.of(context)!.settings.arguments as Map;
    print(currency_tapped_data);

    return Scaffold(
      appBar: AppBar(
      title:Text
      ('This is SubscribeUnsubscribe \n Page'),
        elevation: 0.0,
      ),
        body:Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 20.0, 0),
          child: Column(
            children: [
              Text('currency_name:${currency_tapped_data["currency_name"]} \n \n price_in_INR:${currency_tapped_data["price"]} \n  \n  changePercent24Hr: \n ${currency_tapped_data["changePercent24Hr"]}',
              style: TextStyle(
                fontSize: 25.0,
              ),
              ),
            ],
          ),
        )

    );
  }
}
