import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data.dart';

/// Provider for list of restaurants.
final FutureProvider<List<Restaurant>> restaurantsProvider =
    FutureProvider<List<Restaurant>>(
        (final FutureProviderRef<List<Restaurant>> ref) async =>
            (json.decode(await rootBundle.loadString('assets/restaurants.json'))
                    as List<dynamic>)
                .map<Restaurant>((final dynamic restaurantJson) =>
                    Restaurant.fromJson(restaurantJson as Map<String, dynamic>))
                .toList());
