class StringManger {
  static const int langIndex = 0;

  // static set setLanguage(int themeIndex) {
  //   langIndex = themeIndex;
  // }

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
  static String get password2 =>
      ["Password Verification", "تاكيد الرقم السري"][langIndex];
  static String get signUp => ["Sign up", "انشاء حساب"][langIndex];
  static String get login => ["Login", "دخول الحساب"][langIndex];
  static String get forgetPassword =>
      ["Forget Password", "نسيت الرقم السري"][langIndex];

  // landing Page
  static String get userPage => ["Profile", "صفحه المستخدم"][langIndex];
  static String get match => ["Practice matches", "لعب مباراه"][langIndex];
  static String get coaches => ["Coaches", "المدربين"][langIndex];
  static String get benfits => ["Benefits", "الخصومات"][langIndex];
  static String get store => ["Store", "المتجر"][langIndex];
  static String get tournaments => ["Tournaments", "المسابقات"][langIndex];
  static String get leaderBoard => ["Leader board", "ترتيب الاشخاص"][langIndex];
  static String get customerSupport =>
      ["Customer support", "خدمه العملاء"][langIndex];

  // info
  static String get category => ["Category", "التنصيف"][langIndex];
  static String get player => ["Player", "لاعب"][langIndex];
  static String get coach => ["Coach", "مدرب"][langIndex];
  static String get referee => ["Referee", "حكم"][langIndex];
  static String get fieldOwner => ["Field owner", "صاحب ملعب"][langIndex];
  static String get game => ["Game", "اللعبه"][langIndex];
  static String get football => ["Football", "كره قدم"][langIndex];
  static String get basketball => ["Basketball", "كره سله"][langIndex];
  static String get volleyball => ["Volleyball", "كره طائره"][langIndex];
  static String get tennis => ["Tennis", "تنس"][langIndex];
}
