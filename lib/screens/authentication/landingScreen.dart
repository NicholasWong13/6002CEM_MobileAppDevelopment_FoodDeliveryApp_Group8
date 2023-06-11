import 'package:bite_buddies/screens/authentication/register/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:bite_buddies/screens/authentication/login/loginScreen.dart';
import '../../const/colors.dart';
import '../../utils/helper.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = "/landingScreen";
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    var screenHeight = queryData.size.height / 100;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bright,
          body: Padding(
            padding: EdgeInsets.all(screenWidth * 5),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:screenHeight * 5),
                      child: SizedBox(
                        height: screenHeight * 30,
                        child: Image.asset(
                          Helper.getAssetName("logo.png", "virtual"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text('Bite Buddies',
                        style: TextStyle(
                          fontSize: screenHeight * 4,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: screenHeight * 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 6,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        },
                        child: Text("Login",style: TextStyle(fontSize: screenHeight * 2),),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 6,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                          MaterialStateProperty.all(AppColor.main),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(
                              side:
                              BorderSide(color: AppColor.main, width: 1.5),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignUpScreen.routeName);
                        },
                        child: Text("Create an Account",style: TextStyle(fontSize: screenHeight * 2),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}