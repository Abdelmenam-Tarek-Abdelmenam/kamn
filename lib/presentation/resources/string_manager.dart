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
  static String get warning => ["Warning", "تحذير"][langIndex];
  static String get no => ["No", "لا"][langIndex];
  static String get yes => ["Yes", "نعم"][langIndex];
  static String get exitQ => [
        "Are you Sure you want Exit ?",
        "هل انت متاكد انك تريد المغادره؟"
      ][langIndex];

  // login view
  static String get emailAddress =>
      ["Email address", "البريد الاكتروني"][langIndex];
  static String get password => ["Password", "الرقم السري"][langIndex];
  static String get signUp => ["Sign up", "انشاء حساب"][langIndex];

  // landing Page
  static String get userPage => ["Profile", "صفحه المستخدم"][langIndex];
  static String get match => ["Practice matches", "لعب مباراه"][langIndex];
  static String get coaches => ["Coaches", "المدربين"][langIndex];
  static String get benfits => ["Benefits", "الخصومات"][langIndex];
  static String get store => ["Store", "المتجر"][langIndex];
  static String get tournaments => ["Tournaments", "المسابقات"][langIndex];
  static String get customerSupport =>
      ["Customer support", "خدمه العملاء"][langIndex];
}
