import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:daisy_recipe/app/modules/widgets/app_input_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class LoginView extends GetView<AuthenticationController> {
  const LoginView({Key? key}) : super(key: key);

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
                  key: ctrl.formLoginKey,
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
                                      'Welcome back',
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
                                        labelText: 'Enter username',
                                        validator: (value) => (value!.isEmpty? "Please enter username" : null),
                                        controller: ctrl.usernameCtrl,
                                      ),
                                      AppSpacer.H30,
                                      AppInputField(
                                        labelText: 'Enter password',
                                        validator: (value) => (value!.isEmpty? "Please enter password" : null),
                                        controller: ctrl.passwordCtrl,
                                        // isPassword: true,
                                        obscureText: ctrl.toggleLoginEye,
                                        showObscureText: ctrl.toggleLoginEye,
                                      ),
                                      AppSpacer.H10,
                                      const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey
                                        ),
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
                              ctrl.login();
                            },
                            // onTap: () => Get.to(() => HomeView()),
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
                                  'Login',
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
