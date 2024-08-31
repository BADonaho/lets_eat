import 'package:equatable/equatable.dart';

/// Restaurant details including name and type of cuisine.
class Restaurant extends Equatable {
  final int id;
  final String name;
  final String cuisine;

  const Restaurant({
    required this.id,
    required this.name,
    required this.cuisine,
  });

  factory Restaurant.fromJson(final Map<String, dynamic> restaurantJson) =>
      Restaurant(
        id: restaurantJson['id'],
        name: restaurantJson['name'],
        cuisine: restaurantJson['cuisine'],
      );

  @override
  List<dynamic> get props => <dynamic>[
        id,
        name,
        cuisine,
      ];
}
