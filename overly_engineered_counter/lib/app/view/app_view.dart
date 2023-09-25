import 'package:flutter/material.dart';
import 'package:overly_engineered_counter/counter/counter.dart';

class OverlyEngineeredCounterApp extends StatelessWidget {
  const OverlyEngineeredCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overly Engineered Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CounterScreen(),
    );
  }
}
