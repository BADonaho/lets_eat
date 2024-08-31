import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data.dart';

/// Provider for list of restaurants filtered by query.
final Provider<List<Restaurant>> filteredRestaurantsProvider =
    Provider<List<Restaurant>>((final ProviderRef<List<Restaurant>> ref) =>
        (ref.watch(restaurantsProvider).asData?.value ?? const <Restaurant>[])
            .where((final Restaurant restaurant) => restaurant.name
                .toLowerCase()
                .contains(ref
                    .watch(searchQueryProvider)
                    .toLowerCase()
                    .replaceAll(RegExp('[‘’]'), "'")))
            .toList());
