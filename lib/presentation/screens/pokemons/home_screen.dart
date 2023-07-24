import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: ListView.builder(
        // itemCount: ,
        itemBuilder: (context, index) {
          // return Row(
          //   children: [
          //     Container(
          //       color: Colors.red,
          //       child: Text('data'),
          //     ),
          //     Container(
          //       color: Colors.red,
          //       child: Text('data'),
          //     )
          //   ],
          // );
          return Text('data');
        },
      ),
    );
  }
}
