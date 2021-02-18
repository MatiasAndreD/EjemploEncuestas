import 'package:flutter/material.dart';

class AppGlobals {
  AppGlobals._();

  static const appColor = Color(0xFFD90429);
  static const secondaryColor = Color(0xFF566681);
  static const tertiaryColor = Color(0xFF0FA3C3);
  static const backgroundColor = Color(0xFFEDF2F4);
  static const redColor = Color(0xFFEF233C);
  static const roseColor = Color(0xFFFAAFAF);
  static const whiteColor = Color(0xFFFFFFFF);
  static const lightColor = Color(0xFFEDF2F4);
  static const darkColor = Color(0xFF2B2D42);
  static const linkColor = Color(0xFF005F75);
  static const transparent = Color(0x00000000);

  static MaterialColor primarySwatch = MaterialColor(
    0xFFD90429,
    <int, Color>{
      50: appColor.withOpacity(.1),
      100: appColor.withOpacity(.2),
      200: appColor.withOpacity(.3),
      300: appColor.withOpacity(.4),
      400: appColor.withOpacity(.5),
      500: appColor.withOpacity(.6),
      600: appColor.withOpacity(.7),
      700: appColor.withOpacity(.8),
      800: appColor.withOpacity(.9),
      900: appColor.withOpacity(1),
    },
  );

  static const TextTheme textTheme = TextTheme(
    headline6: title,
    subtitle2: subtitle,
    bodyText1: body1,
    caption: caption,
  );

  static const String fontName = 'Lato';

  static const double extendedAppbar = 65.0;

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: darkColor,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: darkColor,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: darkColor,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: darkColor,
  );

  static const BoxShadow boxShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, .08),
    blurRadius: 16,
    offset: Offset(0, 8),
  );

  static const BoxShadow redBoxShadow = BoxShadow(
    color: Color.fromRGBO(217, 5, 41, .25),
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static const BoxShadow backBoxShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, .25),
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static const BoxShadow appBarShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, .16),
    blurRadius: 6,
    offset: Offset(0, -2),
  );

  ///Develop emails
  static const String emails =
      'mgoncalves@acl.cl,acancio@acl.cl,agomez@acl.cl,aiturriaga@acl.cl,jlriquelme@acl.cl,faguilera@acl.cl';
  static const String emailsPublic =
      'mgoncalves@acl.cl,acancio@acl.cl,agomez@acl.cl,aiturriaga@acl.cl,jlriquelme@acl.cl,faguilera@acl.cl';
  static const String emailsJob =
      'mgoncalves@acl.cl,acancio@acl.cl,agomez@acl.cl,aiturriaga@acl.cl,jlriquelme@acl.cl,faguilera@acl.cl';
  static const String emailsAcademy =
      'mgoncalves@acl.cl,acancio@acl.cl,agomez@acl.cl,aiturriaga@acl.cl,jlriquelme@acl.cl,faguilera@acl.cl';

  ///Prod emails
  static const String emailsProd = 'rrhh@acl.cl';
  static const String emailsPublicProd = 'info@acl.cl';
  static const String emailsJobProd = 'seleccion@acl.cl';
  static const String emailsAcademyProd = 'ventas@aclacademy.cl';

  ///notification firebase
  static const String notificationDev = 'notification_wordpress';
  static const String notificationProd = 'prod_notification_wordpress';
  static const String chatsDev = 'chatsDev';
  static const String chatsProd = 'chats';
  static const String eventsDev = 'eventsDev';
  static const String eventsProd = 'events';
  static const String usersDev = 'usersDev';
  static const String usersProd = 'users';

  static const String docs = "46";
}

class SolicitudeType {
  SolicitudeType._();
  static const String Generic = 'generic';
  static const String Vacation = 'vacation';
  static const String Benefit = 'benefit';
  static const String Comment = 'comment';
  static const String Courses = 'courses';
  static const String Bot = 'bot';
}
