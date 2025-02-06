import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokezuka/providers/settings_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LocaleSelect extends ConsumerWidget {
  const LocaleSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return DropdownButton(
      value: locale,
      items: AppLocalizations.supportedLocales.map((locale) {
        final localization = AppLocalizations.delegate.load(locale);
        return DropdownMenuItem(
          value: locale.languageCode,
          child: FutureBuilder(
            future: localization,
            builder: (context, snapshot) {
              final data = snapshot.data;
              final enabled =
                  snapshot.connectionState != ConnectionState.done ||
                      data == null;
              return Skeletonizer(
                enabled: enabled,
                child: Text(data!.localeDisplayName),
              );
            },
          ),
        );
      }).toList(),
      onChanged: (locale) {
        if (locale == null) {
          return;
        }
        ref.read(settingsNotifierProvider.notifier).setLocale(locale);
      },
    );
  }
}
