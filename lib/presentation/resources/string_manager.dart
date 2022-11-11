class StringManger {
  static late int langIndex;

  static set setLanguage(int themeIndex) {
    langIndex = themeIndex;
  }

  static const empty = "";

  // application info
  static String get appName => ["K.A.M.N", "كامن"][langIndex];
  static String get en => ["EN", "انجيزي"][langIndex];
  static String get ar => ["AR", "عربي"][langIndex];
  static String get system => ["System", "النظام"][langIndex];
  static String get dark => ["Dark", "مظلم"][langIndex];
  static String get light => ["Light", "مضئ"][langIndex];
}
