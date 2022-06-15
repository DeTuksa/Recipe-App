import 'package:daisy_recipe/app/data/constants/app_colors.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/modules/home/views/home_view.dart';
import 'package:daisy_recipe/app/modules/widgets/app_input_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SignupView extends GetView {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(Get.context!).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          height: 70,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                  Icons.arrow_back
                              ),
                              AppSpacer.W10,
                              Text(
                                'Create an account',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                          width: Get.width,
                          color: AppColor.appGrey6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Input your credentials',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black
                                  ),
                                ),
                                AppSpacer.H40,
                                AppInputField(

                                ),
                                AppSpacer.H30,
                                AppInputField(),
                                AppSpacer.H30,
                                AppInputField(),
                                AppSpacer.H30,
                                AppInputField(),
                                AppSpacer.H30,
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Get.to(() => HomeView()),
                      child: Container(
                        width: Get.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.primaryRed
                        ),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
