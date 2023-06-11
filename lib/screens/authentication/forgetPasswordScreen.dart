import 'package:flutter/material.dart';

import '../../const/colors.dart';
import 'sentOTPScreen.dart';

class ForgetPwScreen extends StatefulWidget {
  static const routeName = "/restpwScreen";

  @override
  State<ForgetPwScreen> createState() => _ForgetPwScreenState();
}

class _ForgetPwScreenState extends State<ForgetPwScreen> {
  bool _obscureText = true;

  final TextEditingController emailController = TextEditingController();
  // focus nodes
  FocusNode focusNode1;
  final field1Key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    focusNode1 = FocusNode();
    focusNode1.addListener(() {
      if (!focusNode1.hasFocus) {
        field1Key.currentState?.validate();
      }
    });
  }

  @override
  void dispose() {
    focusNode1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bright,
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 5),
          child: ListView(
            children: [
              SizedBox(
                height: screenWidth * 10,
              ),
              // reset password icon
              Icon(
                Icons.lock,
                size: screenWidth * 20,
              ),
              SizedBox(
                height: screenWidth * 5,
              ),
              Center(
                child: Text("Forget Password",
                    style: TextStyle(
                      fontSize: screenWidth * 6,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                height: screenWidth * 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 5),
                child: Center(
                  child: Text(
                    "Please enter your email to receive a link to create a new password via email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 4,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenWidth * 20,
              ),
              // Password Text Field
              TextFormField(
                  key: field1Key,
                  focusNode: focusNode1,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    // email validation using regex
                    else if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }

                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: AppColor.dark),
                  decoration: textFieldDecoration(screenWidth,
                      hintText: 'Email Address', labelText: 'Email')),
              SizedBox(
                height: screenWidth * 5,),
              SizedBox(
                height: screenWidth * 12,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SendOTPScreen.routeName);
                  },
                  child: Text("Send",style: TextStyle(fontSize: screenWidth * 3.5)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  InputDecoration textFieldDecoration(double screenWidth,
      {String hintText, String labelText}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColor.primary, fontSize: screenWidth * 3.5),
        labelText: labelText,
        labelStyle: TextStyle(color: AppColor.primary, fontSize: screenWidth * 3.5),
        focusColor: AppColor.dark,
        contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 5, vertical: screenWidth * 4),
        floatingLabelStyle:
        TextStyle(color: AppColor.dark, fontSize: screenWidth * 4),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.dark), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.dark), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.dark), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.dark), //<-- SEE HERE
          borderRadius: BorderRadius.circular(50.0),
        ),
        suffixIcon: labelText == "Password"
            ? InkWell(
          onTap: () {
            setState(() {
              if (_obscureText == true) {
                _obscureText = false;
              } else {
                _obscureText = true;
              }
            });
          },
          child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: AppColor.main),
        )
            : null);
  }
}
