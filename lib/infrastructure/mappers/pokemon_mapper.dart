import 'package:pokedex/domian/entities/pokemon.dart';
import 'package:pokedex/infrastructure/models/pokemons_response.dart';

class PokemonsMapper {
  static Pokemon pokemonDbToEntity(PokemonResonse pokemon) =>
      Pokemon(name: pokemon.name);
}
