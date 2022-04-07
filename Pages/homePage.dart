import 'package:cryptro_tracker/Models/cryptocurrency.dart';
import 'package:cryptro_tracker/Providers/market_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:   Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 0,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            Text('Crypto Tracker',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
            SizedBox(height: 10,),
            Expanded(child:Consumer<MarketProvider>(builder:(context,marketProvider,child){
              if(marketProvider.isLoading==true){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                if(marketProvider.markets.length>0){
                  return ListView.builder(
                    padding: EdgeInsets.all(0),
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()
                    ),
                    itemCount: marketProvider.markets.length,
                    itemBuilder: (context,index){
                      Cryptocurrency currentCrypto=marketProvider.markets[index];
                      return ListTile(

                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(currentCrypto.image!),
                        ),
                        title: Text(currentCrypto.name!),
                        subtitle: Text(currentCrypto.symbol!.toUpperCase()),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Pkr "+currentCrypto.currentPrice!.toStringAsFixed(4),
                              style: TextStyle(color: Color(0xFF0395eb,),fontSize: 18,fontWeight: FontWeight.bold),),
                            Builder(builder: (context){
                              double priceChange=currentCrypto.priceChange24h!;
                              double priceChangePercentage=currentCrypto.priceChangePercentage24h!;

                              if(priceChange<0){
                                return Text("${priceChangePercentage.toStringAsFixed(2)}%  (${priceChange.toStringAsFixed(4)})",style: TextStyle(color: Colors.red),);
                              }else{
                                return Text("+${priceChangePercentage.toStringAsFixed(2)}%  (+${priceChange.toStringAsFixed(4)})",style: TextStyle(color: Colors.green),);
                              }
                            })
                          ],
                        ),
                      );
                    },);
                }else{
                  return Text('data Not Found');
                }
              }
            })),
          ],
        ),
      ),
    ));
  }
}
