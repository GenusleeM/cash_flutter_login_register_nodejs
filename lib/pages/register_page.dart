import 'package:flutter/material.dart';
import 'package:flutter_login_register_nodejs/models/login_request_model.dart';
import 'package:flutter_login_register_nodejs/models/register_request_model.dart';
import 'package:flutter_login_register_nodejs/services/api_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? firstname;
  String? lastname;
  String? email;
  String? idNumber;
  String? password;
  String? phone;
  String? address;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#9b59b6"),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
          ),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  // child: Image.asset(
                  //   "assets/images/ShoppingAppLogo.png",
                  //   fit: BoxFit.contain,
                  //   width: 250,
                  // ),
                  child: Text(
                    "Tumira Cash",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 55,
                      color: Color.fromARGB(255, 18, 15, 180),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 30, top: 50),
            child: Text(
              "Register",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.person),
              "Firstname",
              "Firstname",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Firstname can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                firstname = onSavedVal,
              },
              initialValue: "",
              obscureText: false,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.person),
              "Lastname",
              "Lastname",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Lastname can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                lastname = onSavedVal,
              },
              initialValue: "",
              obscureText: false,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.person),
              "Email",
              "Email",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Email can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                email = onSavedVal,
              },
              initialValue: "",
              obscureText: false,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.lock),
              "Password",
              "Password",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Password can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                password = onSavedVal,
              },
              initialValue: "",
              obscureText: hidePassword,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.white.withOpacity(0.7),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.mail),
              "Phone",
              "Phone",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Phone can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                phone = onSavedVal,
              },
              initialValue: "",
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.mail),
              "Id Number",
              "Id Number",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Id Number can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                idNumber = onSavedVal,
              },
              initialValue: "",
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.mail),
              "Address",
              "Address",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Address can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                address = onSavedVal,
              },
              initialValue: "",
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Register",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isApiCallProcess = true;
                  });

                  RegisterRequestModel model = RegisterRequestModel(firstname: firstname!, lastname: lastname!, idNumber: idNumber!, email: email!, password: password!, phone: phone!, address: address!);

                  APIService.register(model).then(
                    (response) {
                      setState(() {
                        isApiCallProcess = false;
                      });

                      if (response.data != null) {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "Registration Successful. Please login to the account",
                          "OK",
                          () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                              (route) => false,
                            );
                          },
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          response.message,
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: HexColor("283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
