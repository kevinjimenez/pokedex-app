import 'package:go_router/go_router.dart';
import 'package:pokedex/presentation/screens/pokemons/pokemon_screen.dart';
import 'package:pokedex/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'pokemon/:id',
          name: PokemonScreen.name,
          builder: (context, state) {
            final String no = state.pathParameters['id'] ?? 'no-id';
            return PokemonScreen(no: no);
          },
        )
      ])
]);
