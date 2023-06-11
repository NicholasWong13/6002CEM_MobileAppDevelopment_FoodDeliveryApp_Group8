import 'package:bite_buddies/screens/offers/offers_data.dart';
import 'package:flutter/material.dart';
import 'package:bite_buddies/const/colors.dart';
import 'package:bite_buddies/utils/helper.dart';

import '../item/item_screen.dart';

class OfferScreen extends StatelessWidget {
  static const routeName = "/offerScreen";
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Latest Offers",
            style: TextStyle(
              color: AppColor.disabled,
              fontSize: screenWidth * 6,
              fontWeight: FontWeight.bold,
            ),
          ),
          toolbarHeight: screenWidth * 20,
          elevation: 1,
          backgroundColor: AppColor.bright,
        ),
        backgroundColor: AppColor.bright,
        // body: ListView(
        //   children: [
        //     SizedBox(
        //       height: screenWidth * 2,
        //     ),
        //     OfferCard(
        //       image: Image.asset(
        //         Helper.getAssetName("breakfast.jpg", "real"),
        //         fit: BoxFit.cover,
        //       ),
        //       name: "Cafe de Noires",
        //     ),
        //     OfferCard(
        //       image: Image.asset(
        //         Helper.getAssetName("western2.jpg", "real"),
        //         fit: BoxFit.cover,
        //       ),
        //       name: "Isso",
        //     ),
        //     OfferCard(
        //       image: Image.asset(
        //         Helper.getAssetName("coffee3.jpg", "real"),
        //         fit: BoxFit.cover,
        //       ),
        //       name: "Cafe Beans",
        //     ),
        //   ],
        // ),
        body: ListView.builder(
            itemCount: DealList().deals.length,
            itemBuilder: (context, index) {
              DealList dealList = DealList();
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodItemScreen(
                                imageUrl: dealList.deals[index]['image'],
                                itemName: dealList.deals[index]['name'],
                                description: dealList.deals[index]
                                    ['description'],
                                price: dealList.deals[index]['price'],
                                rating: dealList.deals[index]['rating'],
                                reviews: dealList.deals[index]['reviews'],
                                type: dealList.deals[index]['type'],
                              )));
                },
                child: OfferCard(
                  image: dealList.deals[index]['image'],
                  name: dealList.deals[index]['name'],
                  ratings: dealList.deals[index]['rating'],
                  reviewCount: dealList.deals[index]['reviews'],
                  foodType: dealList.deals[index]['type'],
                  price: dealList.deals[index]['price'],
                ),
              );
            }));
  }
}

class OfferCard extends StatelessWidget {
  final String name;
  final String image;
  final double ratings;
  final int reviewCount;
  final String foodType;
  final double price;

  const OfferCard({
    Key key,
    @required this.name,
    @required this.image,
    @required this.ratings,
    @required this.reviewCount,
    @required this.foodType,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width / 100;

    return Container(
      height: screenWidth * 65,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: screenWidth * 50,
            width: double.infinity,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          SizedBox(height: screenWidth * 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: screenWidth * 4,
                    color: AppColor.primary,
                  ),
                ),
                Text(
                  "\$$price",
                  style: TextStyle(
                    fontSize: screenWidth * 4,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 5),
            child: Row(
              children: [
                Image.asset(
                  Helper.getAssetName("star_filled.png", "virtual"),
                ),
                SizedBox(width: screenWidth * 2),
                Text(
                  ratings.toString(),
                  style: TextStyle(
                    color: AppColor.main,
                    fontSize: screenWidth * 3.5,
                  ),
                ),
                SizedBox(width: screenWidth * 2),
                Text(
                  "($reviewCount ratings) Cafe",
                  style: TextStyle(fontSize: screenWidth * 3.5),
                ),
                SizedBox(width: screenWidth * 2),
                Padding(
                  padding: EdgeInsets.only(bottom: screenWidth * 2),
                  child: Text(
                    ".",
                    style: TextStyle(
                      color: AppColor.main,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 3.5,
                    ),
                  ),
                ),
                Text(
                  " $foodType Food",
                  style: TextStyle(fontSize: screenWidth * 3.5),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
