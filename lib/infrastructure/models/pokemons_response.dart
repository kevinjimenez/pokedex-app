class PokemonsResponse {
    final int count;
    final String next;
    final dynamic previous;
    final List<PokemonResonse> results;

    PokemonsResponse({
        required this.count,
        required this.next,
        this.previous,
        required this.results,
    });

    factory PokemonsResponse.fromJson(Map<String, dynamic> json) => PokemonsResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonResonse>.from(json["results"].map((x) => PokemonResonse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class PokemonResonse {
    final String name;
    final String url;

    PokemonResonse({
        required this.name,
        required this.url,
    });

    factory PokemonResonse.fromJson(Map<String, dynamic> json) => PokemonResonse(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
