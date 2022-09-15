import 'package:flutter/material.dart';
import 'package:listprovider/provider/MovieProvider.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>MovieProvider(),child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    ));

  }
}