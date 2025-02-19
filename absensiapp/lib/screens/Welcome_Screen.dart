import 'package:flutter/material.dart';
import '../widgets/Custom_Scaffold.dart';
import '../widgets/Welcome_Button.dart';
import 'SignIn_Screen.dart';
import 'SignUp_Screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'E-Absensi\n',
                          style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black, // Set text color to black
                          )),
                      TextSpan(
                          text: '\n Welcome UdaCoding',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black, // Set text color to black
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: SignInScreen(),
                      color: Colors.transparent,
                      textColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: SignUpScreen(),
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
