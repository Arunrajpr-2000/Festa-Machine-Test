import 'package:festa_task/common/const.dart';
import 'package:festa_task/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: bgcolor,
        width: 500,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/amazing-cheerful-business-woman-standing-with-arms-crossed_171337-8487.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699833600&semt=ais'),
              ),
              k20height,
              k20height,
              const Text(
                'Sarah White',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              k20height,
              k20height,
              const Text(
                'email  :sarahwhite@festahub.com',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              k10height,
              const Text(
                'phone  :(763)-487-8585',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              const Expanded(child: k10height),
              ElevatedButton(
                  onPressed: () {
                    Get.offAll(const LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          13), // Adjust the radius as needed
                    ),
                    primary: whitecolor, // Background color
                  ),
                  child: const Text(
                    'LOG OUT',
                    style: TextStyle(color: bgcolor),
                  )),
              k20height,
              k20height
            ],
          ),
        ),
      ),
    );
  }
}
