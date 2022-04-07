import 'package:cryptro_tracker/Pages/homePage.dart';
import 'package:cryptro_tracker/Providers/market_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
      ChangeNotifierProvider<MarketProvider>(create: (context)=>MarketProvider()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );

  }
}
