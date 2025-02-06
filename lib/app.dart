import 'package:flutter/material.dart';
import 'package:pokezuka/screens/pokemons_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ポケモン図鑑',
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const PokemonsScreen(),
    );
  }
}
