import 'package:flutter/material.dart';
import 'package:bite_buddies/const/colors.dart';
import 'package:bite_buddies/utils/helper.dart';

class DessertScreen extends StatefulWidget {
  static const routeName = '/dessertScreen';
  

  @override
  State<DessertScreen> createState() => _DessertScreenState();
}

class _DessertScreenState extends State<DessertScreen> {
  bool showSearch = false;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Desserts",
          style: TextStyle(
            color: AppColor.disabled,
            fontSize: screenWidth * 6,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: screenWidth * 20,
        elevation: 1,
        backgroundColor: AppColor.bright,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.disabled,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              showSearch?Icons.close:Icons.search,
              color: AppColor.disabled,
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
          showSearch
              ? Padding(
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
                              border: InputBorder.none,
                              hintText: "Search",
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: AppColor.primary,
                          ),
                          onPressed: () {
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
          Expanded(
            child: ListView(
              children: [
                DessertCard(
                  image: Image.asset(
                    Helper.getAssetName("apple_pie.jpg", "real"),
                    fit: BoxFit.cover,
                  ),
                  name: "French Apple Pie",
                  shop: "Minute by tuk tuk",
                  rating: "4.9",
                ),
                SizedBox(
                  height: screenWidth * 2,
                ),
                DessertCard(
                  image: Image.asset(
                    Helper.getAssetName("dessert2.jpg", "real"),
                    fit: BoxFit.cover,
                  ),
                  name: "Dark Chocolate Cake",
                  shop: "Cakes by Tella",
                  rating: "4.7",
                ),
                SizedBox(
                  height: screenWidth * 2,
                ),
                DessertCard(
                  image: Image.asset(
                    Helper.getAssetName("dessert4.jpg", "real"),
                    fit: BoxFit.cover,
                  ),
                  name: "Street Shake",
                  shop: "Cafe Racer",
                  rating: "4.9",
                ),
                SizedBox(
                  height: screenWidth * 2,
                ),
                DessertCard(
                  image: Image.asset(
                    Helper.getAssetName("dessert5.jpg", "real"),
                    fit: BoxFit.cover,
                  ),
                  name: "Fudgy Chewy Brownies",
                  shop: "Minute by tuk tuk",
                  rating: "4.9",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DessertCard extends StatelessWidget {
  const DessertCard({
    Key key,
    @required String name,
    @required String rating,
    @required String shop,
    @required Image image,
  })  : _name = name,
        _rating = rating,
        _shop = shop,
        _image = image,
        super(key: key);

  final String _name;
  final String _rating;
  final String _shop;
  final Image _image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: _image,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    style: Helper.getTheme(context).headline4.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Helper.getAssetName("star_filled.png", "virtual"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        _rating,
                        style: TextStyle(color: AppColor.main),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        _shop,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          ".",
                          style: TextStyle(color: AppColor.main),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Desserts",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
