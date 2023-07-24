import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/domian/entities/pokemon.dart';
import 'package:pokedex/presentation/providers/pokemons_repository_provider.dart';

final getPokemonsProvider =
    StateNotifierProvider<PokemonsNotifier, List<Pokemon>>((ref) {
  final fetchPokemos = ref.watch(pokemonsRepositoryProvider).getPokemons;
  return PokemonsNotifier(fetchPokemos: fetchPokemos);
});

typedef PokemonCallback = Future<List<Pokemon>> Function();

class PokemonsNotifier extends StateNotifier<List<Pokemon>> {
  PokemonCallback fetchPokemos;

  PokemonsNotifier({required this.fetchPokemos}) : super([]);

  Future<void> loadPokemos() async {
    final pokemons = await fetchPokemos();
    state = [...state, ...pokemons];
  }
}
