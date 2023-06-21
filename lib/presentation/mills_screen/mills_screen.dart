import 'package:flutter/material.dart';
import 'fetch_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Fetcher',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const MillScreen());
          case '/fetch_data':
            return MaterialPageRoute(builder: (_) => const TableDataPage());
          default:
            return null;
        }
      },
      initialRoute: '/',
    );
  }
}

class MillScreen extends StatelessWidget {
  const MillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Fetcher'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/fetch_data');
          },
          child: const Text('Fetch Data'),
        ),
     ),
     );
     }
}