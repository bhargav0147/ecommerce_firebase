import 'package:ecommerce_firebase/utils/firebase_helper.dart';
import 'package:get/get.dart';

class EcommerceController extends GetxController
{
  RxInt tabIndex=0.obs;
  RxMap<dynamic,dynamic> userData = {}.obs;
  void readUserData()
  {
    userData.value = FirebaseHelper.helper.getUserData();

  }
}