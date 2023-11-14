import 'dart:developer';

import 'package:festa_task/common/const.dart';
import 'package:festa_task/controller/button_controller.dart';
import 'package:festa_task/controller/home_controller.dart';
import 'package:festa_task/model/user_model.dart';
import 'package:festa_task/networkHelper/api_service.dart';
import 'package:festa_task/view/home_screen/widget/filter_widget.dart';
import 'package:festa_task/view/home_screen/widget/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //final controller = Get.find<HomeController>();
  // @override
  // void initState() {
  //   super.initState();

  //   getdata();
  // }

  String title = '';
  // List<Result> resluts = [];
  // bool isloading = false;

  // Future<void> getdata() async {
  //   setState(() {
  //     isloading = true;
  //   });

  //   resluts = await ApiService.getuserdata(null);
  //   print(resluts.length);
  //   setState(() {
  //     isloading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.widgets,
              color: whitecolor,
            )),
        actions: [
          TextButton(
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              child: const Text(
                'FILTER',
                style: TextStyle(color: Colors.white54),
              ))
        ],
      ),
      endDrawer: FilterWidget(),
      drawer: const InfoWidget(),
      body: GetBuilder<HomeController>(
          init: controller,
          builder: (context) {
            return Obx(
              () => controller.isloading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.result.isEmpty
                      ? const Center(
                          child: Text('No Data'),
                        )
                      : ListView.builder(
                          itemCount: controller.result.length,
                          itemBuilder: (context, index) {
                            title =
                                "${controller.result[index].name?.first} ${controller.result[index].name?.last}";

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey, // Set the border color
                                    width: 1, // Set the border width
                                  ),
                                ),
                                height: 300,
                                width: double.infinity,
                                child: GetBuilder<ButtonController>(
                                    init: ButtonController(),
                                    builder: (bc) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 70,
                                                color: bgcolor,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Center(
                                                  child: CircleAvatar(
                                                    radius: 50,
                                                    backgroundColor: bgcolor,
                                                    backgroundImage:
                                                        NetworkImage(controller
                                                                .result[index]
                                                                .picture
                                                                ?.large ??
                                                            ''),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          k20height,
                                          Text(
                                            bc.headtext,
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                          k10height,
                                          Text(
                                            bc.text == '' ? title : bc.text,
                                            style: const TextStyle(
                                                letterSpacing: 0.5,
                                                color: bgcolor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15),
                                          ),
                                          k20height,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    bc.text =
                                                        "${controller.result[index].name?.first} ${controller.result[index].name?.last}";
                                                    bc.headtext =
                                                        'Hi, My name is';
                                                    bc.update();
                                                    print(title);
                                                  },
                                                  icon: const Icon(
                                                    Icons
                                                        .person_outline_outlined,
                                                    size: 30,
                                                  )),
                                              k10width,
                                              IconButton(
                                                  onPressed: () {
                                                    bc.text = controller
                                                            .result[index]
                                                            .email ??
                                                        '';
                                                    title = bc.text;
                                                    bc.headtext =
                                                        'My email address is';
                                                    bc.update();
                                                    print(title);
                                                  },
                                                  icon: const Icon(
                                                    Icons.mail_outline_outlined,
                                                    size: 25,
                                                  )),
                                              k10width,
                                              IconButton(
                                                  onPressed: () {
                                                    bc.text = controller
                                                        .result[index].dob!.date
                                                        .toString();
                                                    bc.headtext =
                                                        'My birthday is';
                                                    bc.update();
                                                    print(title);
                                                  },
                                                  icon: const Icon(
                                                    Icons.calendar_month,
                                                    size: 25,
                                                  )),
                                              k10width,
                                              IconButton(
                                                  onPressed: () {
                                                    bc.text = controller
                                                            .result[index]
                                                            .location
                                                            ?.city ??
                                                        '';
                                                    bc.headtext =
                                                        'My address is';
                                                    bc.update();
                                                    print(title);
                                                  },
                                                  icon: const Icon(
                                                    Icons.map,
                                                    size: 25,
                                                  )),
                                              k10width,
                                              IconButton(
                                                  onPressed: () {
                                                    bc.text = controller
                                                            .result[index]
                                                            .phone ??
                                                        '';
                                                    bc.headtext =
                                                        'My phone number is';
                                                    bc.update();
                                                    print(title);
                                                  },
                                                  icon: const Icon(
                                                    Icons.phone,
                                                    size: 25,
                                                  ))
                                            ],
                                          )
                                        ],
                                      );
                                    }),
                              ),
                            );
                          }),
            );
          }),
    );
  }
}
