import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'fr'.obs; // Default language is French

  void changeLanguage(String language) {
    selectedLanguage.value = language;
    Get.updateLocale(Locale(language));
  }
}
