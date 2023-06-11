import 'package:flutter/material.dart';
import 'package:bite_buddies/const/colors.dart';
import 'package:bite_buddies/screens/menu/dessertScreen.dart';
import 'package:bite_buddies/utils/helper.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = "/menuScreen";

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool showSearch = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyle(
            color: AppColor.disabled,
            fontSize: screenWidth * 6,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: screenWidth * 20,
        elevation: 1,
        backgroundColor: AppColor.bright,
        actions: [
          IconButton(
            icon: Icon(
              showSearch?Icons.close:Icons.search,
              color: AppColor.primary,
            ),
            onPressed: () {
              setState(() {
                showSearch = !showSearch;
              });
            },
          ),
        ],
      ),
      backgroundColor: AppColor.bright,
      body: Column(
        children: [
          showSearch?Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 5, vertical: screenWidth * 2),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColor.primary)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search for food",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
          ):SizedBox(),
          Expanded(
            child: ListView(
              children: [
                // burger Card
                menuCard(screenWidth, name: "Burgers", image: "hamburger3.jpg"),
                menuCard(screenWidth, name: "Food", image: "western2.jpg"),
                menuCard(screenWidth, name: "Beverage", image: "coffee.jpg"),
                menuCard(screenWidth, name: "Dessert", image: "dessert2.jpg",
                    onTapped: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DessertScreen(),
                        ),
                      );                },),
                menuCard(screenWidth, name: "Bakery", image: "bakery.jpg"),
                menuCard(screenWidth, name: "Pizza", image: "pizza2.jpg"),

              ],
            ),
          ),
        ],
      ),
    );
  }

  menuCard(double screenWidth, {String image, String name, Function onTapped}) {
    return GestureDetector(
      onTap: () {
        if (onTapped!= null) onTapped();
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: screenWidth * 30,
          width: screenWidth * 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(
                Helper.getAssetName(image, "real"),
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: screenWidth * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColor.bright.withOpacity(0.9),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: screenWidth * 2,
                left: screenWidth * 5,
                child: Text(
                  name,
                  style: TextStyle(
                    color: AppColor.bright,
                    fontSize: screenWidth * 6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}