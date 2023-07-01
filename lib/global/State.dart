import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super('en');

  void changeLanguage(String newLanguage) {
    state = newLanguage;
  }
}

final LanguageProvider = StateNotifierProvider<LanguageNotifier, String>(
    (ref) => LanguageNotifier());
