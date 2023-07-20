import 'package:ecommerce_firebase/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello!',
          style: TextStyle(letterSpacing: 1),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            TextFormField(
              controller: txtEmail,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: txtPass,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                String massage = await FirebaseHelper.helper.signInAcoountWithEmailPass(
                    email: txtEmail.text, password: txtPass.text);
                if (massage == "Success") {
                  Get.offAllNamed('home');
                }
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("$massage")));
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Get.toNamed("signUp");
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'or sign in with',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                  String massage = await FirebaseHelper.helper.signInWithGoogle();
                  if (massage == "Success") {
                    Get.offAllNamed('home');
                  }
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("$massage")));
                  },
                  child: Image.asset(
                    'assets/images/google.png',
                    height: 40.0,
                  ),
                ),
                const SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    // Perform Facebook sign in
                  },
                  child: Image.asset(
                    'assets/images/Facebook.png',
                    height: 35.0,
                  ),
                ),
                const SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () async {
                    String massage =
                        await FirebaseHelper.helper.signInWithAnonymously();
                    if (massage == "Success") {
                      Get.offAllNamed('home');
                    }
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("$massage")));
                  },
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/3024/3024605.png',
                    height: 35.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
