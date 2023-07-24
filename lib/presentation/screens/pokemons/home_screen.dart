import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: pokemons.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          final pokemon = pokemons[index];
          final no = index + 1;
          return GestureDetector(
            onTap: () {
              context.push('/pokemon/$no');
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    color: Colors.orange,
                    child: Stack(
                      children: [
                        //* foto pokemon
                        Positioned(
                          right: 0,
                          top: 25,
                          child: Image.network(
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$no.png',
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress != null) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                );
                              }
                              return child;
                            },
                          ),
                        ),
                        //* no pokemon
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Text(
                            '#$no',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        //* nombre pokemon
                        Text(
                          pokemon.name,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ))),
          );
        },
      ),
    );
  }
}
