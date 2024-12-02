import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:e_commerce_test/core/secure_storage_configurations.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  String languageCode = 'en';

  void changeLanguage(String language) async {
    await SecureStorageConfigurations.saveLanguage(language);
    languageCode = language;
    emit(LanguageChanged(language: language));
  }

  void getLanguage() async {
    final language = await SecureStorageConfigurations.getLanguage();
    if (language != null) {
      languageCode = language;
    }
    emit(LanguageChanged(language: languageCode));
  }
}
