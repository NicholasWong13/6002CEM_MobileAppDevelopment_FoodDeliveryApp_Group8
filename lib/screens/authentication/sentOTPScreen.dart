import 'package:flutter/material.dart';

import '../../const/colors.dart';
import 'resetPasswordScreen.dart';

class SendOTPScreen extends StatelessWidget {
  static const routeName = "/sendOTP";
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(screenWidth * 5),
            child: ListView( 
              children: [
                SizedBox(
                  height: screenWidth * 10,
                ),
                Icon(
                  Icons.lock,
                  size: screenWidth * 20,
                ),
                SizedBox(
                  height: screenWidth * 5
                ),
                Center(
                  child: Text(
                    "OTP Sent to your Email",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 5),
                  child: Center(
                    child: Text(
                      "Enter the OTP sent to your email to reset your password",
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OTPInput(),
                      OTPInput(),
                      OTPInput(),
                      OTPInput(),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenWidth * 10,
                ),
                SizedBox(
                  height: screenWidth * 12,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(NewPwScreen.routeName);
                    },
                    child: Text("Next"),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't Recieve? "),
                    Text(
                      "Click Here",
                      style: TextStyle(
                        color: AppColor.main,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class OTPInput extends StatelessWidget {
  const OTPInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: ShapeDecoration(
        color: AppColor.bright,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 20),
            child: Text(
              "*",
              style: TextStyle(fontSize: 45),
            ),
          ),
          TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}
