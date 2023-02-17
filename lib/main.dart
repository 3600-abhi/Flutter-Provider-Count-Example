import 'package:flutter/material.dart';
import 'package:learn_provider/providers/CountProvider.dart';
import 'package:learn_provider/screens/CountExample.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Learning Provider",
        home: CountExample(),
      ),
    );
  }
}
