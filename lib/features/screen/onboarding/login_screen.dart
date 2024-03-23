import 'package:flutter/material.dart';
import 'package:news_app/constrains/widgets/colors.dart';
import 'package:news_app/constrains/widgets/styles.dart';
import 'package:news_app/constrains/widgets/widgets.dart';
import 'package:news_app/features/screen/home_screen/home_screen.dart';
import 'package:news_app/features/screen/onboarding/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [stackedBackground(), loginCard(context)]));
  }

  Center loginCard(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          color: UiColors.white,
          elevation: 30,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 400,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Enter Details',
                    style: TextStyle(
                        fontSize: 22,
                        color: UiColors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                    decoration:
                        myInputDecoration(hint: 'Email', icon: Icons.email)),
                const SizedBox(height: 10),
                TextField(
                    decoration: myInputDecoration(
                        hint: 'Password', icon: Icons.password)),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          backgroundColor: UiColors.bgBlue,
                          foregroundColor: UiColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text('Login')),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          foregroundColor: UiColors.bgBlue),
                      child: const Text('Create New Account')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
