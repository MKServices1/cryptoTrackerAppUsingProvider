import 'dart:convert';

import 'package:http/http.dart' as http;
class API{
  Future<List<dynamic>> getMarkets() async{
    Uri reqPath=Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=pkr&order=market_cap_desc&per_page=20&page=1&sparkline=false');
    await http.get(reqPath);

    var response=await http.get(reqPath);
    var decodedResponse= jsonDecode(response.body);

    List<dynamic> markets= decodedResponse as List<dynamic>;
    return markets;
}
}