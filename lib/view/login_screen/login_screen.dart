import 'package:festa_task/common/const.dart';
import 'package:festa_task/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // Get the screen width and height
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: bgcolor,
      body: Center(
          child: SizedBox(
        height: screenHeight * 0.42,
        width: screenWidth * 0.75,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(25), // Adjust the radius as needed
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Log In',
                  style: TextStyle(
                      color: bgcolor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const TextfieldWidget(labelText: 'email'),
                k10height,
                const TextfieldWidget(
                    labelText: 'password',
                    suffixIcon: Icon(
                      Icons.visibility,
                      size: 16,
                    )),
                k20height,
                SizedBox(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.04,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.off(HomeScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the radius as needed
                        ),
                        primary: bgcolor, // Background color
                      ),
                      child: const Text(
                        'LOG IN',
                        style: TextStyle(color: whitecolor),
                      )),
                ),
                k10height,
                SizedBox(
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.04,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.off(HomeScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the radius as needed
                        ),
                        primary: whitecolor, // Background color
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'G ',
                            style: TextStyle(
                                color: bgcolor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Sign in with google',
                            style: TextStyle(color: bgcolor),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({super.key, required this.labelText, this.suffixIcon});
  final String labelText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        cursorColor: bgcolor,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIconColor: bgcolor,
          suffixIconColor: bgcolor,
          prefixIcon: const Icon(Icons.email_outlined, size: 20),
          hintText: labelText,
          hintStyle: const TextStyle(
              color: bgcolor, fontSize: 12, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
