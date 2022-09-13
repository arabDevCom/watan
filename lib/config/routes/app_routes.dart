import 'package:elwatn/features/bloggs/presentation/screens/bloggs.dart';
import 'package:elwatn/features/details/presentation/screens/details.dart';
import 'package:elwatn/features/filter/presentation/screens/filter.dart';
import 'package:elwatn/features/language/presentation/screens/language.dart';
import 'package:elwatn/features/new_added/presentation/screens/new_added.dart';
import 'package:elwatn/features/register/presentation/screens/forget_password.dart';
import 'package:elwatn/features/register/presentation/screens/new_password.dart';
import 'package:elwatn/features/register/presentation/screens/reset_password.dart';
import 'package:elwatn/features/register/presentation/screens/welcome_register.dart';
import 'package:elwatn/features/soled_states/presentation/screens/soled_states.dart';
import 'package:elwatn/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/about_us/presentation/screens/about_us.dart';
import '../../features/ads/presentation/screens/ads.dart';
import '../../features/bloggs/presentation/screens/bloggs_details.dart';
import '../../features/contact_us/presentation/screens/contact_us.dart';
import '../../features/details/presentation/screens/detales photo.dart';
import '../../features/login/presentation/screens/login.dart';
import '../../features/notification/presentation/screens/notification.dart';
import '../../features/profile/presentation/screens/agency_profile.dart';
import '../../features/profile/presentation/screens/agency_screen.dart';
import '../../features/profile/presentation/screens/new_edit_agency.dart';
import '../../features/register/presentation/screens/register_company.dart';
import '../../features/register/presentation/screens/register_screen.dart';
import '../../features/terms_and_conditions/presentation/screens/terms_and_conditions.dart';


class Routes {
  static const String initialRoute = '/';
  static const String navigatorRoute = '/navigator';
  static const String newAddedRoute = '/newAdded';
  static const String notificationRoute = '/notification';
  static const String bloggsRoute = '/bloggs';
  static const String bloggsDetailsRoute = '/bloggsDetails';
  static const String filterRoute = '/filter';
  static const String detailsRoute = '/details';
  static const String soledStatesRoute = '/soledStates';
  static const String adsRoute = '/ads';
  static const String languageRoute = '/language';
  static const String detailsPhotoScreenRoute = '/detailsPhotoScreen';
  static const String loginScreenRoute = '/loginScreen';
  static const String welcomeRegisterRoute = '/welcomeRegister';
  static const String registerScreenRoute = '/registerScreen';
  static const String aboutUsRoute = '/aboutUs';
  static const String termsAndConditionsScreenRoute = '/termsAndConditionsScreen';
  static const String agencyScreenRoute = '/agencyScreen';
  static const String contactUsScreenRoute = '/contactUsScreen';
  static const String registerCompanyRoute = '/registerCompany';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String resetPasswordRoute = '/resetPassword';
  static const String newPasswordRoute = '/newPassword';
  static const String newAndEditAgencyScreenRoute = '/newAndEditAgencyScreen';
  static const String agencyProfileScreenRoute = '/agencyProfileScreen';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      // case Routes.newAddedRoute:
      //   return MaterialPageRoute(
      //     builder: (context) =>   const NewAdded(kind: "",slider: []),
      //   );
      case Routes.notificationRoute:
        return MaterialPageRoute(
          builder: (context) =>  const NotificationScreen(),
        );
        case Routes.bloggsRoute:
        return MaterialPageRoute(
          builder: (context) =>  const BloggsScreen(),
        );
        case Routes.bloggsDetailsRoute:
        return MaterialPageRoute(
          builder: (context) =>   BloggsDetailsScreen(title: "var park project"),
        );
      case Routes.filterRoute:
        return MaterialPageRoute(
          builder: (context) =>   const FilterScreen(),
        );
        case Routes.detailsRoute:
        return MaterialPageRoute(
          builder: (context) =>   const DetailsScreen(),
        );
        case Routes.soledStatesRoute:
        return MaterialPageRoute(
          builder: (context) =>   const SoledStates(),
        );
      case Routes.adsRoute:
        return MaterialPageRoute(
          builder: (context) =>   const AdsScreen(),
        );
        case Routes.languageRoute:
        return MaterialPageRoute(
          builder: (context) =>   const LanguageScreen(),
        );
        case Routes.detailsPhotoScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>   const DetailsPhotoScreen(),
        );
        case Routes.loginScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>    LoginScreen(),
        );
        case Routes.welcomeRegisterRoute:
        return MaterialPageRoute(
          builder: (context) =>   const WelcomeRegister(),
        );
        case Routes.registerScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>   const RegisterScreen(),
        );
        case Routes.aboutUsRoute:
        return MaterialPageRoute(
          builder: (context) =>   AboutUsScreen(),
        );
        case Routes.termsAndConditionsScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>   TermsAndConditionsScreen(),
        );
        case Routes.agencyScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>   const AgencyScreen(),
        );
        case Routes.contactUsScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>   const ContactUsScreen(),
        );
        case Routes.registerCompanyRoute:
        return MaterialPageRoute(
          builder: (context) =>   const RegisterCompany(),
        );
        case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
          builder: (context) =>   const ForgetPasswordScreen(),
        );
        case Routes.resetPasswordRoute:
        return MaterialPageRoute(
          builder: (context) =>   const ResetPassword(),
        );
        case Routes.newPasswordRoute:
        return MaterialPageRoute(
          builder: (context) =>   const NewPassword(),
        );
        case Routes.newAndEditAgencyScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>   const NewAndEditAgencyScreen(),
        );
        case Routes.agencyProfileScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>   const AgencyProfileScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}