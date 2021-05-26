import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_page_crypto/services/data_CryptoCurrency.dart';
import 'package:home_page_crypto/pages/homePage.dart';


      class CryptoCurrencyList extends StatefulWidget {
        @override
        _CryptoCurrencyListState createState() => _CryptoCurrencyListState();
      }

    class _CryptoCurrencyListState extends State<CryptoCurrencyList> {

            @override
            void initState()  {
              // TODO: implement initState
             updatePrice();
              super.initState();
            }




            //currencies in home page.
              Map pricedata={};
              Map currency_subscribed_data={};
              List<currency> currency_data=[
              currency(url_data:'bitcoin',currency_pic:'bitcoin.png',currency_name:'Bitcoin'),
                currency(url_data:'ethereum',currency_pic:'ethereum.png',currency_name:'Ethereum'),
                currency(url_data:'tether',currency_pic:'tether.png',currency_name:'Tether'),
                currency(url_data:'cardano',currency_pic:'cardano.png',currency_name:'Cardano'),
                currency(url_data:'dogecoin',currency_pic:'dogecoin.png',currency_name:'Dogecoin'),
              ];




                //prices to print in home page
                Future<bool> updatePrice() async {
                  for(int index=0;index<currency_data.length;index++) {
                    currency instance = currency_data[index];
                    await instance.getData();
                    pricedata.addAll({
                      '${currency_data[index].currency_name}price_in_USD':instance.price_in_USD,
                      '${currency_data[index].currency_name}price_in_INR':instance.price_in_INR,
                    '${currency_data[index].currency_name}marketCapUsd':instance.marketCapUsd,
                    '${currency_data[index].currency_name}maxSupply':instance.maxSupply,
                    '${currency_data[index].currency_name}volumeUsd24Hr':instance.volumeUsd24Hr,
                    '${currency_data[index].currency_name}changePercent24Hr':instance.changePercent24Hr,
                      '${currency_data[index].currency_name}vwap24Hr':instance.vwap24Hr,

                    });
                  }
                  return true;
                }




          @override
        Widget build(BuildContext context) {
          return Scaffold(

              resizeToAvoidBottomInset : false,

                appBar: AppBar(
                  title: Text('CryptoCurrencyList'),
                  centerTitle: true,
                  elevation: 0.0,
                ),




            body:
            FutureBuilder(
              future: updatePrice(),
             builder:(context,  snapshot) {



                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator(
                  ));
                  }

                else {
            return Stack(
              children: [

               ListView.builder(
                  itemCount: currency_data.length,

                  itemBuilder: (context, index) {
                    print('begining of align');


                    return Card(

                      // ignore: file_names
                      child:Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 4.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, 'SubscribeUnsubscribe', arguments: ({
                                'currency_name': currency_data[index]
                                    .currency_name,
                                'currency_pic': currency_data[index].url_data,
                                'price': pricedata["${currency_data[index]
                                    .currency_name}price_in_INR"],


                                /*'marketCapUsd':pricedata["${currency_data[index].currency_name}marketCapUsd"],
                              'maxSupply':pricedata["${currency_data[index].currency_name}maxSupply"],
                              'volumeUsd24Hr':pricedata["${currency_data[index].currency_name}volumeUsd24Hr"],*/

                                'changePercent24Hr': pricedata["${currency_data[index]
                                    .currency_name}changePercent24Hr"],
                                /*'vwap24Hr':pricedata["${currency_data[index].currency_name}vwap24Hr"],*/


                                })
                            );
                          },


                          title: Text('${currency_data[index].currency_name}  \n ${pricedata["${currency_data[index].currency_name}price_in_USD"]}',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),),

                          subtitle: Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: FlatButton(
                                    onPressed: (){
                                      /*Map intermediate={
                                        '${currency_data[index]
                                            .currency_name}':currency_data[index]
                                            .currency_name,
                                        '${currency_data[index].currency_name}price_in_INR':pricedata["${currency_data[index]
                                            .currency_name}price_in_INR"],
                                      };*/
                                    currency_subscribed_data.addAll({
                                      '${currency_data[index]
                                          .currency_name}':pricedata["${currency_data[index]
                                            .currency_name}price_in_INR"],

                                    });
                                    },

                                  color: Colors.blue,
                                  child: Text('Subscribe'),

                                ),
                                  // ignore: file_name
                              ),

                            ],

                          ),
                        ),

                      ),
                    );

                  },

                ),
                Align(
                  alignment: Alignment.bottomRight,
                    child: FlatButton(
                      child: Text('FlatButton'),
                      onPressed: ()   {
                         Navigator.pushReplacementNamed(
                            context,'HomePage', arguments: (pricedata) as Map
                        );

                      },
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ),

               ],
              );





          }
        }
            )
            );
  }
      }
