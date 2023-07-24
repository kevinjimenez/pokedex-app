import 'package:pokedex/domian/entities/pokemon.dart';
import 'package:pokedex/domian/entities/pokemon_info.dart';

abstract class PokemonsDatasource {
  Future<List<Pokemon>> getPokemons();
  Future<PokemonInfo> getPokemonByNo(String no);
}
