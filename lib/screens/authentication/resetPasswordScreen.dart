import 'package:bite_buddies/screens/authentication/login/loginScreen.dart';
import 'package:flutter/material.dart';
import '../../const/colors.dart';

class NewPwScreen extends StatefulWidget {
  static const routeName = "/newPw";

  @override
  State<NewPwScreen> createState() => _NewPwScreenState();
}

class _NewPwScreenState extends State<NewPwScreen> {
  bool _obscureText = true;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // focus nodes
  FocusNode focusNode1;
  final field1Key = GlobalKey<FormFieldState>();
  FocusNode focusNode2;
  final field2Key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    focusNode1 = FocusNode();
    focusNode1.addListener(() {
      if (!focusNode1.hasFocus) {
        field1Key.currentState?.validate();
      }
    });
    focusNode2 = FocusNode();
    focusNode2.addListener(() {
      if (!focusNode2.hasFocus) {
        field2Key.currentState?.validate();
      }
    });
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
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
                Icons.key,
                size: screenWidth * 20,
              ),
              SizedBox(
                height: screenWidth * 5,
              ),
              Center(
                child: Text("Reset Password",
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
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  } else if (value.length > 20) {
                    return 'Password must be less than 20 characters';
                  }
                  // password should contain at least one uppercase letter
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  // password should contain at least one lowercase letter
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Password must contain at least one lowercase letter';
                  }
                  // password should contain at least one digit
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must contain at least one digit';
                  }
                  // password should contain at least one special character
                  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }

                  return null;
                },
                obscureText: _obscureText,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: AppColor.dark),
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Enter Password', labelText: 'Password'),
              ),
              SizedBox(
                height: screenWidth * 5,
              ),
              // Confirm Password Text Field
              TextFormField(
                key: field2Key,
                focusNode: focusNode2,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  } else if (value.length > 20) {
                    return 'Password must be less than 20 characters';
                  }
                  // password should contain at least one uppercase letter
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  // password should contain at least one lowercase letter
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Password must contain at least one lowercase letter';
                  }
                  // password should contain at least one digit
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must contain at least one digit';
                  }
                  // password should contain at least one special character
                  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }

                  return null;
                },
                obscureText: _obscureText,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: AppColor.dark),
                decoration: textFieldDecoration(screenWidth,
                    hintText: 'Enter Password Again', labelText: 'Confirm Password'),
              ),
              SizedBox(
                height: screenWidth * 5,
              ),
              SizedBox(
                height: screenWidth * 12,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                  },
                  child: Text("Next",style: TextStyle(fontSize: screenWidth * 3.5),),
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
