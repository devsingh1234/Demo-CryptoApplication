import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:home_page_crypto/services/data_CryptoCurrency.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

        class _HomeState extends State<Home>  {
          @override
          void initState() {
    // TODO: implement initState
    super.initState();
  }

          Map data={};



            // ignore: file_names
  @override
        Widget build(BuildContext context) {
    if (data.isEmpty) {
      if (null != ModalRoute.of(context)!.settings.arguments) {
        data = ModalRoute.of(context)!.settings.arguments as Map;
      }
    }
    if(data.isNotEmpty){
      print(data);
    };



          return Scaffold(
              resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text('Subscribed Cryptocurrencies '),
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Colors.deepPurple,
            ),





      body: Stack(
        children: [

          Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),

        // ignore: file_names



            child:  Column(
              children:[
                if(data.isNotEmpty) Stack(
                  children: [
          SingleChildScrollView(
          physics: ScrollPhysics(),
                    child:ListView.builder(
                        shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                        itemBuilder:(context,index) {
                          var key = data.keys.elementAt(index);
                        return Card(
                          child: ListTile(

                            title: Text('${key}    ${data['${key}']['price_in_INR']}'),

                          ),
                        );
                        }
                    )
          ),

                  ],

                ),



           ],
         ),



),
          Align(

            alignment: Alignment.bottomRight,
            child:FlatButton(
              color:   Colors.deepPurple,
              minWidth: 50.0,
              height: 50.0,
              child: Text('navigate to cryptocurrency list',
              style: TextStyle(
                color: Colors.white,
              ),),
              onPressed: ()  {
                Navigator.pushNamed(context, 'CryptoCurrencyList'
                );
              },

            ),
          ),
              ],



    )
          );
  }



}
