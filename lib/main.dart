import 'package:bite_buddies/firebase_options.dart';
import 'package:bite_buddies/screens/navbar/bottom_navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bite_buddies/screens/more/changeAddressScreen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

import 'operations/user_data.dart';
import 'screens/authentication/spashScreen.dart';
import 'screens/authentication/landingScreen.dart';
import 'screens/authentication/login/loginScreen.dart';
import 'screens/authentication/register/registerScreen.dart';
import 'screens/authentication/forgetPasswordScreen.dart';
import 'screens/authentication/sentOTPScreen.dart';
import 'screens/authentication/resetPasswordScreen.dart';
import 'screens/home/homeScreen.dart';
import 'screens/menu/menuScreen.dart';
import 'screens/more/moreScreen.dart';
import 'screens/offers/offerScreen.dart';
import 'screens/profile/profileScreen.dart';
import 'screens/menu/dessertScreen.dart';
import 'screens/home/individualItem.dart';
import 'screens/more/payment/paymentScreen.dart';
import 'screens/more/notifications/notificationScreen.dart';
import 'screens/more/about/aboutScreen.dart';
import 'screens/more/inbox/inboxScreen.dart';
import 'screens/more/orders/myOrderScreen.dart';
import 'screens/more/checkoutScreen.dart';
import './const/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(Phoenix(child: MyApp()));
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserData()),
      ],
      child: Builder(
        builder: (context){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: "Metropolis",
              primarySwatch: Colors.blue,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    AppColor.main,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    AppColor.main,
                  ),
                ),
              ),
              textTheme: TextTheme(
                headline3: TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                headline4: TextStyle(
                  color: AppColor.disabled,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                headline5: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.normal,
                  fontSize: 25,
                ),
                headline6: TextStyle(
                  color: AppColor.primary,
                  fontSize: 25,
                ),
                bodyText2: TextStyle(
                  color: AppColor.disabled,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            routes: {
              LandingScreen.routeName: (context) => LandingScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              SignUpScreen.routeName: (context) => SignUpScreen(),
              ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
              SendOTPScreen.routeName: (context) => SendOTPScreen(),
              NewPwScreen.routeName: (context) => NewPwScreen(),
              // IntroScreen.routeName: (context) => IntroScreen(),
              BottomNavigation.routeName: (context) => BottomNavigation(),
              HomeScreen.routeName: (context) => HomeScreen(),
              MenuScreen.routeName: (context) => MenuScreen(),
              OfferScreen.routeName: (context) => OfferScreen(),
              ProfileScreen.routeName: (context) => ProfileScreen(),
              MoreScreen.routeName: (context) => MoreScreen(),
              DessertScreen.routeName: (context) => DessertScreen(),
              IndividualItem.routeName: (context) => IndividualItem(),
              PaymentScreen.routeName: (context) => PaymentScreen(),
              NotificationScreen.routeName: (context) => NotificationScreen(),
              AboutScreen.routeName: (context) => AboutScreen(),
              InboxScreen.routeName: (context) => InboxScreen(),
              MyOrderScreen.routeName: (context) => MyOrderScreen(),
              CheckoutScreen.routeName: (context) => CheckoutScreen(),
              ChangeAddressScreen.routeName: (context) => ChangeAddressScreen(),
              
            },
          );
        },
      ),
    );
  }
}
