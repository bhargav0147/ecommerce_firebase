import 'package:ecommerce_firebase/ecommerce/view/login/signUp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'ecommerce/view/homeScreen/home_screen.dart';
import 'ecommerce/view/login/login _screen.dart';
import 'ecommerce/view/login/splesh_screen.dart';
import 'firebase_options.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/':(p0) => SplashScreen(),
    'signIn':(p0) => SignInScreen(),
    'signUp':(p0) => SignUpScreen(),
    'home':(p0) => HomeScreen(),
  },
));
}