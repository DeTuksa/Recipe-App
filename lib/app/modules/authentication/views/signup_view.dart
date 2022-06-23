import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/modules/authentication/controllers/authentication_controller.dart';
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
        child: GetBuilder<AuthenticationController>(
          builder: (ctrl) {
            return SafeArea(
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Form(
                  key: ctrl.formCreateKey,
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
                                color: AppTheme.appGrey6,
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
                                        validator: (value) => (value!.isEmpty? "Please enter name" : null),
                                        controller: ctrl.nameController,
                                      ),
                                      AppSpacer.H30,
                                      AppInputField(
                                        validator: (value) => (value!.isEmpty? "Please enter username" : null),
                                        controller: ctrl.usernameController,
                                      ),
                                      AppSpacer.H30,
                                      AppInputField(
                                        validator: (value) => (value!.isEmpty? "Please enter email address" : null),
                                        controller: ctrl.emailController,
                                        keyboard: KeyboardType.EMAIL,
                                      ),
                                      AppSpacer.H30,
                                      AppInputField(
                                        obscureText: ctrl.toggleCreate,
                                        showObscureText: ctrl.toggleCreate,
                                        controller: ctrl.passwordController,
                                        validator: (value) => (value!.isEmpty? "Please enter password" : null),
                                      ),
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
                            onTap: ctrl.loading.value ? null : () {
                              FocusScope.of(context).unfocus();
                              ctrl.createUser();
                            },
                            child: Obx(() => Container(
                              width: Get.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppTheme.primaryRed
                              ),
                              child: ctrl.loading.value ? const Center(
                                child: SizedBox(
                                  width: 30, height: 30,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ) : const Center(
                                child: Text(
                                  'Create User',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      )
    );
  }
}
