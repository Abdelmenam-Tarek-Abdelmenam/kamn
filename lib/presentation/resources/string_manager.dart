class StringManger {
  static const int langIndex = 0;

  // static set setLanguage(int themeIndex) {
  //   langIndex = themeIndex;
  // }

  static const empty = "";

  // application info
  static String get appName => ["K.A.M.N", "كامن"][langIndex];
  static String get all => ["All", "الكل"][langIndex];
  static String get en => ["EN", "انجيزي"][langIndex];
  static String get ar => ["AR", "عربي"][langIndex];
  static String get system => ["System", "النظام"][langIndex];
  static String get dark => ["Dark", "مظلم"][langIndex];
  static String get light => ["Light", "مضئ"][langIndex];
  static String get warning => ["Warning", "تحذير"][langIndex];
  static String get none => ["none", "لا يوجد"][langIndex];
  static String get cancel => ["Cancel", "الغاء"][langIndex];
  static String get confirm => ["Confirm", "تاكيد"][langIndex];
  static String get no => ["No", "لا"][langIndex];
  static String get yes => ["Yes", "نعم"][langIndex];
  static String get photos => ["Photos", "صور"][langIndex];
  static String get noPhotos => ["No photos yet", "لا صور"][langIndex];
  static String get showMore => ["Show more", "رؤيه المزيد"][langIndex];
  static String get reviews => ["Reviews", "التقيمات"][langIndex];
  static String get review => ["Review", "التقيم"][langIndex];
  static String get addReview => ["Add Review", "اضافه تقيم"][langIndex];
  static String get priceUnit => ["EGP", "جنيه"][langIndex];
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
  static String get submit => ["Submit", "تاكيد"][langIndex];
  static String get message => ["Message", "الرساله"][langIndex];
  static String get name => ["Name", "الاسم"][langIndex];
  static String get phone => ["Phone number", "رقم التليفون"][langIndex];
  static String get register => ["Register", "التسجيل"][langIndex];
  static String get wrongPasswords =>
      ["Passwords are not the same", "الرقم السري غير مطابق"][langIndex];
  static String get forgetPassword =>
      ["Forget Password", "نسيت الرقم السري"][langIndex];

  // landing Page
  static String get userPage => ["Profile", "صفحه المستخدم"][langIndex];
  static String get match => ["Play", "لعب مباراه"][langIndex];
  static String get coaches => ["Coaches-Gyms", "المدربين"][langIndex];
  static String get general => ["General", "عام"][langIndex];
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
  static String get fieldOwner => ["Business owner", "صاحب ملعب"][langIndex];
  static String get game => ["Game", "اللعبه"][langIndex];
  static String get gym => ["Gym", "كمال اجسام"][langIndex];
  static String get football => ["Football", "كره قدم"][langIndex];
  static String get basketball => ["Basketball", "كره سله"][langIndex];
  static String get volleyball => ["Volleyball", "كره طائره"][langIndex];
  static String get tennis => ["Padel", "تنس"][langIndex];
  static String get other => ["Other", "غير ذلك"][langIndex];
  static String get appUser => ["App User", "مستخدم"][langIndex];
  static String get subscriptions => ["Subscriptions", "المدفوعات"][langIndex];

  // customer support
  static String get quickContact =>
      ["Quick Contact", "التواصل السريع"][langIndex];
  static String get chat => ["Chat Us", "راسلنا"][langIndex];
  static String get call => ["Call Us", "كلمنا"][langIndex];
  static String get email => ["Email Us", "راسلنا"][langIndex];

  // tournaments
  static String get noTournaments =>
      ["No tournaments active now", "لا يوجد مسابقات الان"][langIndex];

  // Products
  static String get totalPrice => ["Total Price", "السعر النهائي"][langIndex];
  static String get addToCart => ["Add to cart", "اضافه للسله"][langIndex];
  static String get add => ["Add", "اضافه"][langIndex];
  static String get quantity => ["Quantity", "الكميه"][langIndex];
  static String get varieties => ["Varieties", "الانواع"][langIndex];
  static String get chooseVariety =>
      ["Choose Variety", "اختار النوع"][langIndex];
  static String get noOffers =>
      ["No offers available now", "لا عروض الان"][langIndex];
  static String get comeBack => ["Come back later", "عد بعد قليل"][langIndex];

  // benfits
  static String get noBenfits =>
      ["No Benefits Available", "لا يوجد عروض الان"][langIndex];
  static String get medical => ["Medical", "طبي"][langIndex];
  static String get nutrition => ["Nutrition", "تغذيه"][langIndex];
  static String get sport => ["Sport", "رياضي"][langIndex];
  static String get orthopedist => ["Orthopedist", "دكتور عظام"][langIndex];
  static String get packages => ["Packages", "الخدمات"][langIndex];
  static String get physiotherapist =>
      ["Physiotherapist", "علاج طبيعي"][langIndex];

  // matches
  static String get ground => ["Grounds", "الملاعب"][langIndex];
  static String get active => ["active", "المتاح"][langIndex];
  static String get available => ["Available", "المتاح"][langIndex];
  static String get join => ["Join game", "التسجيل"][langIndex];
  static String get community => ["Community", "المتاح"][langIndex];
  static String get noGrounds =>
      ["No available ground now", "لا يوجد ملاعب متاحه"][langIndex];
  static String get noGyms =>
      ["No available gyms now", "لا يوجد صالات متاحه"][langIndex];
  static String get noCoaches =>
      ["No available coaches now", "لا يوجد مدربين متاحه"][langIndex];
  static String get noMatches =>
      ["No available matches now", "لا العاب مفتوحه"][langIndex];
  static String get freeToPlay => [
        "Are you free any time at any place to play ?",
        "هل انت متاح جميع الاوقات للعب في اي مكان"
      ][langIndex];

  // coaches
  static String get noAchievements =>
      ["No Achievements", "لا يوجد انجازات"][langIndex];
  static String get achievements => ["Achievements", "انجازات"][langIndex];
  static String get facilities => ["Facilities", "خدمات"][langIndex];
  static String get details => ["Details", "التفاصيل"][langIndex];
  static String get description => ["Description", "الوصف"][langIndex];
  static String get consultation => ["Consultation", "الاستشارات"][langIndex];
  static String get onlineConsultation =>
      ["Online Consultation", "الاستشارات اونلاين"][langIndex];
  static String get offlineConsultation =>
      ["OffLine Consultation", "الاستشارات في المكان"][langIndex];
  static String get overview => ["Overview", "عام"][langIndex];

  // errors
  static String get contactsErrors => [
        "Can't launch this contact method",
        "لا يمكن الاتصال بهذه الطريقه"
      ][langIndex];
  static String get emptyReview =>
      ["Review can't be empty", "لا يمكنك ارسال تقيم فارغ"][langIndex];
}
