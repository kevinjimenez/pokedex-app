import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/presentation/providers/pokemons_provider.dart';
import 'package:pokedex/presentation/widgets/widgets.dart';

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
    const gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: pokemons.length,
        gridDelegate: gridDelegate,
        itemBuilder: (BuildContext context, int index) {
          final pokemon = pokemons[index];
          final no = index + 1;
          return ItemPokemon(
            no: '$no',
            pokemon: pokemon,
          );
        },
      ),
    );
  }
}
