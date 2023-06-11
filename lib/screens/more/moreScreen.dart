import 'package:bite_buddies/screens/more/payment/paymentScreen.dart';
import 'package:bite_buddies/screens/more/privacy/privacy_screen.dart';
import 'package:bite_buddies/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:bite_buddies/const/colors.dart';
import 'package:bite_buddies/screens/more/about/aboutScreen.dart';
import 'package:bite_buddies/screens/more/inbox/inboxScreen.dart';
import 'package:bite_buddies/screens/more/orders/myOrderScreen.dart';
import 'package:bite_buddies/screens/more/notifications/notificationScreen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = "/moreScreen";
  
  
  
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    
    return Scaffold(
      appBar: customAppBar(context, title: 'More', backButton: false),
      backgroundColor: AppColor.bright,
      body: ListView(
        children: [
          moreTile(
            screenWidth,
            context,
            title: "Payment Details",
            icon: Icons.payments_outlined,
            color: Colors.green,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(),
                ),
              );
            },
          ),
          moreTile(screenWidth, context,
              title: "My Orders",
              icon: Icons.shopping_bag_outlined,
              color: Colors.orange, onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyOrderScreen(),
              ),
            );
          }),
          moreTile(
            screenWidth,
            context,
            title: "Notifications",
            icon: Icons.notifications_outlined,
            color: Colors.red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
          ),
          moreTile(
            screenWidth,
            context,
            title: "Inbox",
            icon: Icons.mail_outline,
            color: Colors.blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InboxScreen(),
                ),
              );
            },
          ),
          moreTile(
            screenWidth,
            context,
            title: "About Us",
            icon: Icons.info_outline,
            color: Colors.purple,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AboutScreen(),
                ),
              );
            },
          ),
          moreTile(
            screenWidth,
            context,
            title: "FAQs",
            icon: Icons.question_answer_outlined,
            color: Colors.pink,
          ),
          moreTile(
            screenWidth,
            context,
            title: "Contact Us",
            icon: Icons.phone_outlined,
            color: Colors.yellow,
          ),
          moreTile(
            screenWidth,
            context,
            title: "Privacy Policy",
            icon: Icons.privacy_tip_outlined,
            color: Colors.teal,
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PrivacyPolicyScreen(),
                ),
              );
            }
          ),
          moreTile(
            screenWidth,
            context,
            title: "Terms & Conditions",
            icon: Icons.description_outlined,
            color: Colors.brown,
          ),
          moreTile(
            screenWidth,
            context,
            title: "Logout",
            icon: Icons.logout_outlined,
            color: Colors.grey,
            onTap: ()async{
              // restart whole app
              Phoenix.rebirth(context);
             
            }
          ),
        ],
      ),
    );
    
  }

  Padding moreTile(double screenWidth, BuildContext context,
      {String title, IconData icon, Function onTap, Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 1),
      child: ListTile(
        leading: CircleAvatar(
          radius: screenWidth * 6,
          backgroundColor: color,
          child: Icon(
            icon,
            color: AppColor.bright,
            size: screenWidth * 6,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: screenWidth * 4, color: AppColor.dark),
        ),
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
      ),
    );
  }
}
