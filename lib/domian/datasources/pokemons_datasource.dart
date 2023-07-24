import 'package:pokedex/domian/entities/entities.dart';

abstract class PokemonsDatasource {
  Future<List<Pokemon>> getPokemons();
}