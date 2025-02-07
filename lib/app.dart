import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokezuka/providers/settings_provider.dart';
import 'package:pokezuka/screens/pokemons_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return MaterialApp(
      title: 'ポケモン図鑑',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(locale),
      home: const PokemonsScreen(),
    );
  }
}
