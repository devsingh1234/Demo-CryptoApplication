import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_page_crypto/services/data_CryptoCurrency.dart';
import 'package:home_page_crypto/pages/homePage.dart';
import 'package:home_page_crypto/pages/detailsCryptoCurrency.dart';


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
              Map currency_subscribed_data={

              };


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
                      '${currency_data[index].currency_name}symbol':instance.symbol,
                      '${currency_data[index].currency_name}sign':instance.sign,
                      '${currency_data[index].currency_name}rank':instance.rank,
                    });
                  }
                  return true;
                }




          @override
        Widget build(BuildContext context) {
          return Scaffold(

              resizeToAvoidBottomInset : false,

                appBar: AppBar(
                  title: Text('Currency List',
                    style: TextStyle(

                      fontSize: 30.0,
                      fontFamily: 'font1.otf',
                      letterSpacing: 1.0,
                    ),
                  ),
                  centerTitle: true,
                  elevation: 0.0,
                  backgroundColor: Colors.deepPurple,
                ),




            body:
            FutureBuilder(
              future: updatePrice(),
             builder:(context,  snapshot) {


                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator(
                    color: Colors.deepPurple,
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

                      margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0,0),
                      color: Colors.grey[200],

                      child:Padding(
                        padding:   EdgeInsets.all(1.0),
                        child: ListTile(

                          onTap: () {
                            Navigator.pushNamed(
                                context, 'DetailsCryptocurrency', arguments: ({
                                'currency_name': currency_data[index].currency_name,
                                'currency_pic': currency_data[index].url_data,
                                'price': pricedata["${currency_data[index].currency_name}price_in_INR"],

                                'rank':pricedata["${currency_data[index].currency_name}rank"],
                                'marketCapUsd':pricedata["${currency_data[index].currency_name}marketCapUsd"],
                              'maxSupply':pricedata["${currency_data[index].currency_name}maxSupply"],
                              'volumeUsd24Hr':pricedata["${currency_data[index].currency_name}volumeUsd24Hr"],

                                'changePercent24Hr': pricedata["${currency_data[index]
                                    .currency_name}changePercent24Hr"],
                                'vwap24Hr':pricedata["${currency_data[index].currency_name}vwap24Hr"],


                                })
                            );
                          },


                          title: Row(
                    children:[
                      Text('${pricedata["${currency_data[index].currency_name}symbol"]}',
                      style:TextStyle(
                            fontFamily: 'font1.otf',
                            //fontWeight: FontWeight.w800,
                            fontSize: 22.0,
                          ),
                      ),
                      SizedBox(width: 10.0),
                      if(pricedata["${currency_data[index].currency_name}sign"]=='+') Icon( Icons.arrow_drop_up_outlined,
                        size: 18,color: Colors.green,),
                      if(pricedata["${currency_data[index].currency_name}sign"]=='') Icon( Icons.arrow_drop_down_outlined,
                        size: 18,color: Colors.red,),
                      SizedBox(width: 2.0),
                        Text('${pricedata["${currency_data[index].currency_name}sign"]}${pricedata["${currency_data[index].currency_name}changePercent24Hr"]}',
                          style:TextStyle(
                            fontFamily: 'font1.otf',
                            //fontWeight: FontWeight.w800,
                            fontSize: 19.0,
                          ),),
                      SizedBox(width: 10.0),
                      Text('\$',
                    style:TextStyle(
                    fontFamily: 'font1.otf',
                    fontSize: 19.0,
                    ),),

                      Text('${pricedata["${currency_data[index].currency_name}price_in_USD"]}',
                        style:TextStyle(
                          fontFamily: 'font1.otf',
                          //fontWeight: FontWeight.w800,
                          fontSize: 19.0,
                        ),),

],
                      ),

                          //SUBSCRIBED DATA
                          subtitle: Row(
                            children: [

                              Padding(
                                  padding: EdgeInsets.fromLTRB(223.0, 15.0, 0, 0),
                                child: FlatButton(
                                    onPressed: (){
                                    currency_subscribed_data.addAll({
                                      '${currency_data[index]
                                          .currency_name}': {
                                      'price_in_INR'  :pricedata["${currency_data[index]
                                            .currency_name}price_in_INR"],

                                      }
                                    });
                                    },

                                  color: Colors.deepPurple,
                                  child: Text('Subscribe',style: TextStyle(
                                    color: Colors.white,
                                  ),),

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
                  alignment: Alignment.bottomLeft,
               child: ButtonTheme(
               buttonColor: Colors.deepPurple[600],
               child: RaisedButton(

                 onPressed: ()   {
                   Navigator.pushNamed(context, 'HomePage',arguments: currency_subscribed_data);
                 },
               child: Icon(
               Icons.arrow_back_ios,
               color: Colors.white,
               size: 30.0,


               ),


               ),
               shape: CircleBorder(side: BorderSide.none),
               padding:EdgeInsets.all(15.0),
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
