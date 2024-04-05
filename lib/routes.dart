import 'package:airbnb/ui/screens/screens.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'helpers/helpers.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: screenHome, page: () => const HomeScreen() ),

  // auth
  GetPage(name: screenRegister, page: () => const RegisterScreen() ),
  GetPage(name: screenLogin, page: () => const LoginScreen() ),

  GetPage(name: screenResetPassword, page: () => const ResetPasswordScreen() ),
  GetPage(name: screenOTPCode, page: () => const OTPCodeScreen() ),
  GetPage(name: screenNewPassword, page: () => const NewPasswordScreen() ),

  GetPage(name: screenMainHome, page: () => const MainHomeScreen() ),

  // GetPage(name: screenUnitView, page: () => const ViewUnitScreen() ),


];

