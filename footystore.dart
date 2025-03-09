import 'package:flutter/material.dart';

void main() {
  runApp(const FootballStoreApp());
}

class FootballStoreApp extends StatelessWidget {
  const FootballStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Store',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Item> _items = [
    Item(
      name: 'Football',
      description: 'High quality leather football',
      price: 25.0,
      imagePath: 'assets/football.jpg',
    ),
    Item(
      imagePath: 'assets/jersey.jpg',
      name: 'Jersey',
      description: 'Official team jersey',
      price: 45.0,
    ),
    Item(
      name: 'Boots',
      description: 'Comfortable football boots',
      price: 60.0,
      imagePath: 'assets/boots.jpg',
    ),
    Item(
      name: 'Shin Guards',
      description: 'Protective shin guards',
      price: 15.0,
      imagePath: 'assets/shin_guards.jpg',
    ),
    Item(
      name: 'Gloves',
      description: 'Goalkeeper gloves',
      price: 20.0,
      imagePath: 'assets/gloves.jpg',
    ),
    Item(
      name: 'Socks',
      description: 'Pair of team socks',
      price: 10.0,
      imagePath: 'assets/socks.jpg',
    ),
    Item(
      name: 'Shorts',
      description: 'Team shorts',
      price: 20.0,
      imagePath: 'assets/shorts.jpg',
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football Store')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset(
                      item.imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Text('Error loading image'));
                      },
                    ),
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item.description),
                    Text('\$${item.price.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  const Item({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}
