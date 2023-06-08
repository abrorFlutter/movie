import 'package:flutter/material.dart';
import 'package:movie/view_model/detail_viewmodel.dart';
import 'package:movie/view_model/main_viewModel.dart';
import 'package:provider/provider.dart';
import 'view/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainViewModel()),
      ChangeNotifierProvider(create: (_) => DetailsViewModel()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


