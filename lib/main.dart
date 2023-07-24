import 'package:flutter/material.dart';
import 'package:pokedex/config/router/app_router.dart';
import 'package:pokedex/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      title: 'Material App',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Material App Bar'),
      //   ),
      //   body: Center(
      //     child: Container(
      //       child: const Text('Hello World'),
      //     ),
      //   ),
      // ),
    );
  }
}