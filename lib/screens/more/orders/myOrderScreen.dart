import 'package:flutter/material.dart';
import 'package:bite_buddies/const/colors.dart';
import 'package:bite_buddies/screens/more/checkoutScreen.dart';
import 'package:bite_buddies/utils/helper.dart';
import '../../../widgets/custom_appbar.dart';
import '../../cart/cart_data.dart';

class MyOrderScreen extends StatelessWidget {
  static const routeName = "/myOrderScreen";

  // method to calculate price total
  double calculateTotal(List items) {
    double total = 0;
    for (var i = 0; i < items.length; i++) {
      total += items[i]['price'];
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    double totalAmount = calculateTotal(items);
    return Scaffold(
      appBar: customAppBar(context, title: 'My Order'),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            items[0]['image'],
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                items[0]['name'],
                                style: Helper.getTheme(context).headline3,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    Helper.getAssetName("star_filled.png", "virtual"),
                                  ),
                                  SizedBox(width: 5),
                                  Text(items[0]['rating'].toString(), style: TextStyle(color: AppColor.main)),
                                  Text(" (${items[0]['reviews']} ratings)"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(items[0]['type']),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      ".",
                                      style: TextStyle(
                                        color: AppColor.main,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(items[0]['description']),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  color: AppColor.bright,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        for (var item in items)
                          BurgerCard(
                            price: item['price'].toString(),
                            name: item['name'],
                            isLast: item == items.last,
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColor.placeholder.withOpacity(0.25),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Delivery Instruction",
                                style: Helper.getTheme(context).headline3,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: AppColor.main,
                                  ),
                                  Text(
                                    "Add Notes",
                                    style: TextStyle(color: AppColor.main),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      for (var item in items)
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${item['name']} x1",
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              "\$${item['price']}",
                              style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: 10),
                      Divider(
                        color: AppColor.placeholder.withOpacity(0.25),
                        thickness: 1.5,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          Text(
                            "\$$totalAmount",
                            style: Helper.getTheme(context).headline3.copyWith(
                              color: AppColor.main,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CheckoutScreen(),
                              ),
                            );
                          },
                          child: Text("Checkout"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BurgerCard extends StatelessWidget {
  const BurgerCard({
    Key key,
    @required this.name,
    @required this.price,
    this.isLast = false,
  }) : super(key: key);

  final String name;
  final String price;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : BorderSide(
            color: AppColor.placeholder.withOpacity(0.25),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$name x1",
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            "\$$price",
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
