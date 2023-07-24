import 'package:dio/dio.dart';
import 'package:pokedex/domian/datasources/pokemons_datasource.dart';
import 'package:pokedex/domian/entities/pokemon.dart';
import 'package:pokedex/domian/entities/pokemon_info.dart';
import 'package:pokedex/infrastructure/mappers/pokemon_info_mapper.dart';
import 'package:pokedex/infrastructure/mappers/pokemon_mapper.dart';
import 'package:pokedex/infrastructure/models/pokemon_info_response.dart';
import 'package:pokedex/infrastructure/models/pokemons_response.dart';

class PokemonsDbDatasource extends PokemonsDatasource {
  @override
  Future<List<Pokemon>> getPokemons() async {
    final dio = Dio(BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/pokemon',
        queryParameters: {
          'limit': 150,
        }));

    final response = await dio.get('/');
    final pokemosResponse = PokemonsResponse.fromJson(response.data);

    final List<Pokemon> pokemons = pokemosResponse.results
        .map((pokemon) => PokemonsMapper.pokemonDbToEntity(pokemon))
        .toList();

    return pokemons;
  }

  @override
  Future<PokemonInfo> getPokemonByNo(String no) async {
    final dio = Dio(BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/pokemon',
        queryParameters: {
          'limit': 150,
        }));

    final response = await dio.get('/$no');
    final pokemonInfo = PokemonInfoResponse.fromJson(response.data);

    final PokemonInfo pokemon =
        PokemonInfoMapper.pokemonInfoToEntity(pokemonInfo);
    // .map((pokemon) => PokemonMapper.pokemonDbToEntity(pokemon))
    // .toList();

    return pokemon;
  }
}
