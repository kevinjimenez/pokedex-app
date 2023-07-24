import 'package:pokedex/domian/entities/entities.dart';

abstract class PokemonsRespository {
  Future<List<Pokemon>> getPokemons();
}