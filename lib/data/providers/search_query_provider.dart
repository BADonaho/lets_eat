import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for restaurant search query.
final StateProvider<String> searchQueryProvider =
    StateProvider<String>((final StateProviderRef<String> ref) => '');
