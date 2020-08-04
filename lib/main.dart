import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kedol/barang_provider.dart';
import './home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BarangProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Keudee Online Powered By Muammar SST',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          fontFamily: 'Nunito',
        ),
        home: home_page(),
      ),
    );
  }
}
