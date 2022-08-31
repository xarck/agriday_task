import 'package:flutter/material.dart';
import 'package:intern_task/controllers/enquiry_details_controller.dart';
import 'package:intern_task/controllers/market_controller.dart';
import 'package:intern_task/utils/util.dart';
import 'package:intern_task/views/market_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MarketController(),
        ),
        ChangeNotifierProvider(
          create: (_) => EnquiryDetailsController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Proxima",
        appBarTheme: AppBarTheme(
          backgroundColor: hexToColor(
            "ededed",
          ),
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        scaffoldBackgroundColor: hexToColor(
          "ededed",
        ),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MarketView(),
    );
  }
}
