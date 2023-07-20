import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/ecommerce/model/ecommers_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper {
  static FirebaseHelper helper = FirebaseHelper();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> signInWithAnonymously() async {
    try {
      await auth.signInAnonymously();
      return "Success";
    } catch (e) {
      return "$e";
    }
  }

  bool checkLogin() {
    User? user;
   user = auth.currentUser;
   return user!=null;
  }

  Future<String> createAcoountWithEmailPass(
      {required String email, required String password})
  async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    }catch(e)
    {
      return "$e";
    }
  }

  Future<String> signInAcoountWithEmailPass(
      {required String email, required String password})
  async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    }catch(e)
    {
      return "$e";
    }
  }

    Future<String> signInWithGoogle() async {
     try{
       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
       final GoogleSignInAuthentication? googleAuth = await googleUser
           ?.authentication;
       final credential = GoogleAuthProvider.credential(
         accessToken: googleAuth?.accessToken,
         idToken: googleAuth?.idToken,
       );
       await FirebaseAuth.instance.signInWithCredential(credential);
       return 'Success';
     }catch(e)
      {
        return '$e';
      }
    }

    getUserData()
    {
      User? user;
      user = auth.currentUser;
      var name = user!.displayName;
      var email = user.email;
      var image = user.photoURL;
      var phone = user.phoneNumber;
      return {'name':name,'email':email,'image':image,'phone':phone};
    }


    // Firebase Firestore Methods >>>>



    void addProductsDataOnFirebase(EcommerceModel model)
    {
      firestore.collection('Products').add(
        {
        'p_name':model.name,
        'p_category':model.category,
        'p_price':model.price,
        'p_info':model.info,
        'p_image':model.image,
        }
      );
    }
}
