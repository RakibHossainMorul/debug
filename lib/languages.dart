import 'package:debug/languages/bangla.dart';
import 'package:debug/languages/english.dart';
import 'package:get/get_navigation/get_navigation.dart';

class languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': englishLanguages,
        'bn_BD': banglaLanguages,
      };
}
