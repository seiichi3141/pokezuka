import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokezuka/models/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Settings build() => Settings(locale: 'ja');

  void setLocale(String locale) {
    state = state.copyWith(locale: locale);
  }
}

@riverpod
String locale(Ref ref) {
  return ref.watch(settingsNotifierProvider.select((value) => value.locale));
}
