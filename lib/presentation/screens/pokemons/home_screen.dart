import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/presentation/providers/pokemons_provider.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<_HomeView> {


  @override
  void initState() {
    super.initState();
    ref.read(getPokemonsProvider.notifier).loadPokemos();
  }


  @override
  Widget build(BuildContext context) {
    final pokemons = ref.watch(getPokemonsProvider);
    return ListView.builder(
      itemCount: pokemons.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
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
        return Text(pokemon.name);
      },
    );
  }
}
