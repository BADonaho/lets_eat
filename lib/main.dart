import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/data.dart';

/// Run Let's Eat app.
void main() => runApp(const ProviderScope(
      child: LetsEat(),
    ));

/// An app for searching for restaurants.
class LetsEat extends StatelessWidget {
  const LetsEat({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => MaterialApp(
        home: const RestraurantsScreen(),
        title: 'Let\'s Eat',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
        ),
        debugShowCheckedModeBanner: false,
      );
}

/// Home screen where user can search for restaurant by name.
class RestraurantsScreen extends ConsumerWidget {
  const RestraurantsScreen({
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final StateController<String> searchQuery =
        ref.watch(searchQueryProvider.notifier);
    final List<Restaurant> restaurants = ref.watch(filteredRestaurantsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Let\'s Eat'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (final String query) => searchQuery.state = query,
            ),
          ),
          Expanded(
            child: restaurants.isEmpty
                ? const Center(
                    child: Text('No restaurants found'),
                  )
                : ListView.builder(
                    itemBuilder: (final BuildContext context, final int index) {
                      final Restaurant restaurant = restaurants[index];
                      return ListTile(
                        title: Text(restaurant.name),
                        subtitle: Text(restaurant.cuisine),
                      );
                    },
                    itemCount: restaurants.length,
                  ),
          ),
        ],
      ),
    );
  }
}
