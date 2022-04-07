import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cryptro_tracker/Models/api.dart';
import 'package:cryptro_tracker/Models/cryptocurrency.dart';

class MarketProvider with ChangeNotifier{

  bool isLoading= true;
  List<Cryptocurrency> markets=[];

  MarketProvider(){
    fetchData();
  }

  void fetchData() async{

    List<dynamic> _market=await API().getMarkets();
      List<Cryptocurrency> temp=[];
    for(var market in _market){
      Cryptocurrency newCrypto=Cryptocurrency.fromJSON(market);

      temp.add(newCrypto);
    }
    markets=temp;
    isLoading=false;
    notifyListeners();

    Timer(const Duration(seconds: 10),()
    {
      fetchData();
    }
    );
  }


}