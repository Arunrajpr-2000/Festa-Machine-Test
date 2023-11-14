import 'package:festa_task/common/const.dart';
import 'package:festa_task/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterWidget extends StatelessWidget {
  FilterWidget({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: double.infinity,
        backgroundColor: bgcolor,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(20),
              color: Colors.white,
            ),
            height: 250,
            width: 250,
            child: GetBuilder(
                init: controller,
                builder: (context) {
                  return Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            children: [
                              Radio<String>(
                                value: 'male',
                                groupValue: controller.selectedgender.value,
                                onChanged: (String? value) {
                                  controller.changegender(value);
                                },
                              ),
                              const Text('Male'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            children: [
                              Radio<String>(
                                value: 'female',
                                groupValue: controller.selectedgender.value,
                                onChanged: (String? value) {
                                  controller.changegender(value);
                                },
                              ),
                              const Text('Female'),
                            ],
                          ),
                        ),
                        k20height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () => controller.onbuttonpressed(),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Adjust the radius as needed
                                  ),
                                  primary: bgcolor, // Background color
                                ),
                                child: const Text(
                                  'FILTER',
                                  style: TextStyle(color: whitecolor),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  controller.changegender(null);
                                  controller.onbuttonpressed();
                                },
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(color: Colors.grey),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  primary: whitecolor,
                                ),
                                child: const Text(
                                  'CLEAR',
                                  style: TextStyle(color: bgcolor),
                                )),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
        ));
  }
}
