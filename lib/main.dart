import 'package:flutter/material.dart';
import 'package:fss/screens/homescreen.dart';
import 'package:fss/provider/fss_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// flutter secure storage provider
        ChangeNotifierProvider(create: (context) => FssProvider()),
      ],
      builder: (context, child) {
        return const MaterialApp(
          home: HomeScreen(),
        );
      },
    );
  }
}
