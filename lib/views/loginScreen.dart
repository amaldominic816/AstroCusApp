// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:AstrowayCustomer/controllers/bottomNavigationController.dart';
import 'package:AstrowayCustomer/controllers/homeController.dart';
import 'package:AstrowayCustomer/controllers/loginController.dart';
import 'package:AstrowayCustomer/controllers/search_controller.dart';
import 'package:AstrowayCustomer/utils/images.dart';
import 'package:AstrowayCustomer/views/bottomNavigationBarScreen.dart';
import 'package:AstrowayCustomer/views/settings/privacyPolicyScreen.dart';
import 'package:AstrowayCustomer/views/settings/termsAndConditionScreen.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:AstrowayCustomer/utils/global.dart' as global;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.find<LoginController>();

  final HomeController homeController = Get.find<HomeController>();

  final _initialPhone = PhoneNumber(isoCode: "IN");
  // late Stream<TcSdkCallback>? _stream;
  late String? codeVerifier;

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   global.warningDialog(context);
    // });
    //otplessFlutterPlugin.setWebviewInspectable(true);
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Get.back();
        Get.back();
        print('call on will pop');
        SystemNavigator.pop();
        //exit(0);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF35093C),
          body: SingleChildScrollView(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Login',
                                style: Get.textTheme.titleLarge!
                                    .copyWith(
                                    fontFamily: 'Marcellus',
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.center),


                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text('Welcome please create or login to continue using this app',
                              style: Get.textTheme.titleMedium!
                                  .copyWith(
                                  fontFamily: 'Marcellus',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ],
                      ),
                      Container(
                          width: Get.width,
                          margin: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.03,vertical: Get.height * 0.4),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              GetBuilder<LoginController>(
                                  builder: (loginController) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                    decoration:  BoxDecoration(
                                      color: Get.theme.primaryColorLight,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color:Get.theme.primaryColorLight,),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: SizedBox(
                                        child: Theme(
                                          data: ThemeData(
                                            dialogTheme: DialogTheme(
                                              contentTextStyle: const TextStyle(color: Colors.white),
                                              backgroundColor: Colors.grey[800],
                                              surfaceTintColor: Colors.grey[800],
                                            ),
                                          ),
                                          //MOBILE
                                          child: SizedBox(
                                            child: InternationalPhoneNumberInput(
                                              textFieldController: loginController.phoneController,
                                              inputDecoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Phone number',
                                                  hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                              onInputValidated: (bool value) {
                                               // log('$value');
                                              },
                                              selectorConfig: const SelectorConfig(
                                                leadingPadding: 2,
                                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                              ),
                                              ignoreBlank: false,
                                              autoValidateMode: AutovalidateMode.disabled,
                                              selectorTextStyle: const TextStyle(color: Colors.white),
                                              searchBoxDecoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(2.w)),
                                                    borderSide: const BorderSide(color: Colors.black),
                                                  ),
                                                  hintText: "Search",
                                                  hintStyle: TextStyle(
                                                    color: Get.theme.primaryColorLight,
                                                  )),
                                              initialValue: _initialPhone,
                                              formatInput: false,
                                              keyboardType: const TextInputType.numberWithOptions(
                                                  signed: true, decimal: false),
                                              inputBorder: InputBorder.none,
                                              onSaved: (PhoneNumber number) {
                                                log('On Saved: ${number.dialCode}');
                                                loginController.updateCountryCode(number.dialCode);
                                                loginController.updateCountryCode(number.dialCode);
                                              },
                                              onFieldSubmitted: (value) {
                                                log('On onFieldSubmitted: $value');
                                                FocusScope.of(context).unfocus();
                                              },
                                              onInputChanged: (PhoneNumber number) {
                                                log('On onInputChanged: ${number.dialCode}');
                                                loginController.updateCountryCode(number.dialCode);
                                                loginController.updateCountryCode(number.dialCode);
                                              },
                                              onSubmit: () {
                                                log('On onSubmit:');
                                                FocusScope.of(context).unfocus();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                    GestureDetector(
                                      onTap: () async {
                                        bool isValid =
                                            loginController.validedPhone();

                                        if (isValid) {
                                          global.showOnlyLoaderDialog(context);
                                          loginController.startHeadlessWithWhatsapp('phone');
                                        } else {
                                          global.showToast(
                                            message: loginController.errorText!,
                                            textColor: global.textColor,
                                            bgColor: global.toastBackGoundColor,
                                          );
                                        }
                                      },
                                      child: Container(
                                        height: 45,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(top: 20),
                                        decoration: BoxDecoration(
                                          color: Get.theme.primaryColorLight,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [

                                            Text(
                                              'Send Otp',
                                              style: TextStyle(
                                                fontFamily: 'Marcellus',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ).tr(),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        global.showOnlyLoaderDialog(context);
                                        loginController.startHeadlessWithWhatsapp("WHATSAPP");
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey
                                          ),
                                          borderRadius: BorderRadius.circular(10.sp)
                                        ),
                                        width: 100.w,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/whatsapp.png",
                                            height:6.h,
                                            width: 16.w,
                                            fit: BoxFit.cover,),
                                            Text('Continue with Whatsapp',style: TextStyle(
                                              color: Colors.white
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        global.showOnlyLoaderDialog(context);
                                        loginController.startHeadlessWithWhatsapp("GMAIL");
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                            ),
                                            borderRadius: BorderRadius.circular(10.sp)
                                        ),
                                        width: 100.w,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/gmail.png",
                                              height:5.h,
                                              width: 7.w,
                                              fit: BoxFit.fitWidth,),
                                            SizedBox(width: 3.w,),
                                            Text('Continue with Gmail',style: TextStyle(
                                                color: Colors.white
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 1.h,),
                                    SizedBox(
                                      child: Row(children: [
                                        Text(
                                          'By signing up, you agree to our ',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 11),
                                        ).tr(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                () => TermAndConditionScreen());
                                          },
                                          child: Text(
                                            'Terms of use',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 11,
                                                color: Colors.blue),
                                          ).tr(),
                                        ),
                                        Text(' and ',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11))
                                            .tr(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => PrivacyPolicyScreen());
                                          },
                                          child: Text(
                                            ' Privacy',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 11,
                                                color: Colors.blue),
                                          ).tr(),
                                        ),
                                      ]),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => PrivacyPolicyScreen());
                                      },
                                      child: Text(
                                        'Policy',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 11,
                                          color: Colors.blue,
                                        ),
                                      ).tr(),
                                    ),
                                  ],
                                );
                              }),



                            ],
                          )),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

}


class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0034000, size.height * -0.0005200);
    path_1.lineTo(size.width * 1.0044000, size.height * 0.0041400);
    path_1.quadraticBezierTo(size.width * 1.0017750, size.height * 0.6117900,
        size.width * 1.0009000, size.height * 0.8143400);
    path_1.cubicTo(
        size.width * 0.7438000,
        size.height * 1.0302400,
        size.width * 0.3289375,
        size.height * 1.0551400,
        size.width * 0.0006000,
        size.height * 0.8136600);
    path_1.quadraticBezierTo(size.width * -0.0010250, size.height * 0.6101200,
        size.width * -0.0034000, size.height * -0.0005200);
    path_1.close();

    return path_1;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}





