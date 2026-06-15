import 'package:flutter/material.dart';
import 'package:seif_portfolio/presentation/view/portfolio_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seif Tariq - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const PortfolioPage(),
    );
  }
}
