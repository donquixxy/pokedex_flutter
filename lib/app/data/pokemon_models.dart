import 'package:pokedex/app/data/parser.dart';

class PokemonModels {
  final String id;
  final String num;
  final String name;
  final String imageUrl;
  final List<String> type;
  final String height;
  final String weight;
  final String candyName;
  final int? candyCount;
  final String egg;
  final double spawnChance;
  final String averageSpawnTime;
  final String spawnTime;
  final List<double?> multipliers;
  final List<String> weakness;
  final List<NextEvolution> nextEvolution;

  PokemonModels(
      {required this.id,
      required this.num,
      required this.name,
      required this.imageUrl,
      required this.type,
      required this.height,
      required this.weight,
      required this.candyName,
      required this.candyCount,
      required this.egg,
      required this.spawnChance,
      required this.averageSpawnTime,
      required this.spawnTime,
      required this.multipliers,
      required this.weakness,
      required this.nextEvolution});

  factory PokemonModels.fromJson(Map<String, dynamic> fromJson) {
    return PokemonModels(
        id: fromJson['id'].toString(),
        num: fromJson['num'],
        name: fromJson['name'],
        imageUrl: fromJson['img'],
        type: List<String>.from(fromJson['type'].map((e) => e)),
        height: fromJson['height'],
        weight: fromJson['weight'],
        candyName: fromJson['candy'],
        candyCount: fromJson['candy_count'],
        egg: fromJson['egg'],
        spawnChance: checkIfDouble(fromJson['spawn_chance']),
        averageSpawnTime: fromJson['avg_spawns'].toString(),
        spawnTime: fromJson['spawn_time'],
        multipliers: fromJson[['multiplers']] != null
            ? List<double>.from(fromJson['multipliers'].map((x) => x))
            : List.empty(),
        weakness: List<String>.from(fromJson['weaknesses'].map((x) => x)),
        nextEvolution: fromJson['next_evolution'] != null
            ? List<NextEvolution>.from(fromJson['next_evolution']
                .map((x) => NextEvolution.fromJson(x)))
            : List.empty());
  }
}

class Type {
  final String pokemonType;

  Type({required this.pokemonType});

  factory Type.fromJson(Map<String, dynamic> fromJson) {
    return Type(pokemonType: fromJson['type']);
  }
}

class Multipliers {
  final double multipliers;

  Multipliers({required this.multipliers});

  factory Multipliers.fromJson(Map<String, dynamic> fromJson) {
    return Multipliers(multipliers: fromJson['multipliers']);
  }
}

class Weakness {
  final String weakness;

  Weakness({required this.weakness});
  factory Weakness.fromJson(Map<String, dynamic> fromJson) {
    return Weakness(weakness: fromJson['weaknesses']);
  }
}

class NextEvolution {
  final String num;
  final String name;

  NextEvolution({required this.num, required, required this.name});

  factory NextEvolution.fromJson(Map<String, dynamic> fromJson) {
    return NextEvolution(num: fromJson['num'], name: fromJson['name']);
  }
}

// class Pokemon {
//   final List<PokemonModels> pokemon;

//   Pokemon({required this.pokemon});

//   // factory Pokemon.fromJson(Map<String, dynamic> json) {
//   //   return Pokemon(
//   //       pokemon: List<PokemonModels>.from(json['pokemon'])
//   //           .map((e) => PokemonModels.fromJson(e))
//   //           );
//   // }
//   factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
//         pokemon: List<PokemonModels>.from(
//             json["pokemon"].map((x) => PokemonModels.fromJson(x))),
//       );
// }
