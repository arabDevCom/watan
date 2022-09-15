import 'package:elwatn/config/locale/app_localizations.dart';

class IsLanguage{
  static bool isEnLanguage(context){
    return AppLocalizations.of(context)!.isEnLocale;
  }
  static bool isArLanguage(context){
    return AppLocalizations.of(context)!.isArLocale;
  }
  static bool isKuLanguage(context){
    return AppLocalizations.of(context)!.isKuLocale;
  }
}