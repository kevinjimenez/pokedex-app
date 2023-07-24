import 'package:dio/dio.dart';
import 'package:pokedex/domian/datasources/datasources.dart';
import 'package:pokedex/domian/entities/entities.dart';
import 'package:pokedex/infrastructure/mappers/mappers.dart';
import 'package:pokedex/infrastructure/models/models.dart';

class PokemonsDbDatasource extends PokemonsDatasource{
  @override
  Future<List<Pokemon>> getPokemons() async{
    final dio = Dio(BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/pokemon',
        queryParameters: {
          'limit': 150,
        }));

    final response = await dio.get('/');
    final pokemosResponse = PokemonsResponse.fromJson(response.data);

    final List<Pokemon> pokemons = pokemosResponse.results
        .map((pokemon) => PokemonMapper.pokemonDbToEntity(pokemon))
        .toList();

    return pokemons;
  }
}