import 'package:ecommerceapp/features/auth/presentation/screens/forgetpassword.dart';
import 'package:ecommerceapp/features/auth/presentation/screens/signup.dart';
import 'package:ecommerceapp/features/auth/presentation/screens/successprocess.dart';
import 'package:ecommerceapp/features/onboording/presentation/screen/language.dart';
import 'package:get/get.dart';
import '../../../features/auth/presentation/screens/home.dart';
import '../../../features/auth/presentation/screens/login.dart';
import '../../../features/auth/presentation/screens/resetpassword.dart';
import '../../../features/auth/presentation/screens/verifycode.dart';
import '../../../features/onboording/presentation/screen/onboarding.dart';
import '../app_routes_info/app_routes_name.dart';
// import 'app_route_redirections.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    page: () => const Language(),
    name: AppRouteName.language,
    // middlewares: [AppRedirection()]
  ),
  GetPage(
      page: () => const OnBoarding(),
      name: AppRouteName.onBoarding,
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500)),
  GetPage(
      page: () => const Login(),
      name: AppRouteName.login,
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 350)),
  GetPage(
      page: () => const SignUp(),
      name: AppRouteName.signUp,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350)),
  GetPage(
      page: () => const ForgetPassword(),
      name: AppRouteName.forgetPassword,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350)),
  GetPage(
      page: () => const ResetPassword(),
      name: AppRouteName.resetPassword,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350)),
  GetPage(
      page: () => const VerfiyCode(),
      name: AppRouteName.verifyCode,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350)),
  GetPage(
      page: () => const Success(),
      name: AppRouteName.success,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350)),
       GetPage(
      page: () => const Home(),
      name: AppRouteName.home,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350)),
];


// CustomTransitionPage<dynamic> _customTransitionWidget({
//   Duration reverseTransitionDuration = const Duration(milliseconds: 200),
//   Duration transitionDuration = const Duration(milliseconds: 200),
//   required Widget page,
//   Cubic fadeCurve = Curves.ease,
//   Cubic slideCurve = Curves.ease,
//   Cubic scaleCurve = Curves.ease,
//   Cubic rotateCurve = Curves.ease,
//   double endRotate = 0.0,
//   double startScale = 1.0,
//   double startOpacity = 1.0,
//   Offset startPosition = Offset.zero,
// }) {
//   return CustomTransitionPage(
//       reverseTransitionDuration: reverseTransitionDuration,
//       transitionDuration: transitionDuration,
//       child: page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return ScaleTransition(
//             scale: Tween(begin: startScale, end: 1.0).animate(CurvedAnimation(
//               parent: animation,
//               curve: scaleCurve,
//             )),
//             child: FadeTransition(
//               opacity:
//                   Tween(begin: startOpacity, end: 1.0).animate(CurvedAnimation(
//                 parent: animation,
//                 curve: fadeCurve,
//               )),
//               child: RotationTransition(
//                 turns:
//                     Tween(begin: 0.0, end: endRotate).animate(CurvedAnimation(
//                   parent: animation,
//                   curve: rotateCurve,
//                 )),
//                 child: SlideTransition(
//                   position: Tween(begin: startPosition, end: Offset.zero)
//                       .animate(CurvedAnimation(
//                     parent: animation,
//                     curve: slideCurve,
//                   )),
//                   child: child,
//                 ),
//               ),
//             ));
//       });
// }
