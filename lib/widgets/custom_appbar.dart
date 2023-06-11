import 'package:flutter/material.dart';

import '../const/colors.dart';

AppBar customAppBar(context,{@required String title, bool backButton = true}){
  MediaQueryData queryData;
  queryData = MediaQuery.of(context);
  var screenWidth = queryData.size.width / 100;
  var screenHeight = queryData.size.height / 100;
  return AppBar(
    title: Row(
      children: [
        if (backButton)
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColor.disabled,
              size: screenHeight * 3.5,
            ),
          ),
        if (backButton) SizedBox(
          width: screenWidth * 2,),
        Text(
          title,
          style: TextStyle(
            color: AppColor.disabled,
            fontSize: screenHeight * 2.8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    automaticallyImplyLeading: false,
    toolbarHeight: screenHeight * 8,
    elevation: 1,
    backgroundColor: AppColor.bright,
  );
}
