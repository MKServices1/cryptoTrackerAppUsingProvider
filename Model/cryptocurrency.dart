class Cryptocurrency{

  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  double? marketCapRank;

  double? high24h;
  double? low24h;
  double? priceChange24h;
  double? priceChangePercentage24h;
  double? ath;
  double? atl;

  Cryptocurrency({
    required this.id, required this.symbol,required this.name,
    required this.image,required this.currentPrice,required this.marketCap,required this.marketCapRank,
    required this.high24h,required this.low24h, required this.priceChange24h,required this.priceChangePercentage24h,
    required this.ath,required this.atl
});

  factory Cryptocurrency.fromJSON(Map<String,dynamic> map){
    return Cryptocurrency(
        id: map["id"], 
        symbol:map['symbol'],
        name: map["name"], 
        image: map["image"],
        currentPrice: double.parse(map["current_price"].toString()) ,
        marketCap: double.parse(map["market_cap"].toString()), 
        marketCapRank: double.parse(map["market_cap_rank"].toString()),
        high24h: double.parse(map["high_24h"].toString()), 
        low24h: double.parse(map["low_24h"].toString()), 
        priceChange24h: double.parse(map["price_change_24h"].toString()),
        priceChangePercentage24h: double.parse(map["price_change_percentage_24h"].toString()),
        ath:double.parse( map["ath"].toString()),
        atl:double.parse( map["atl"].toString()));
  }
}