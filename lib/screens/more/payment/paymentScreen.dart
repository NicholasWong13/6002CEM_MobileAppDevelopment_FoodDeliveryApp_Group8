import 'package:flutter/material.dart';
import 'package:bite_buddies/const/colors.dart';

import '../../../widgets/custom_appbar.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = "/paymentScreen";

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String currentPage = "COD";
  bool saveDetails = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    var screenHeight = queryData.size.height / 100;
    return Scaffold(
      appBar: customAppBar(context, title: 'Payment Details'),
      backgroundColor: AppColor.bright,
      body: Padding(
        padding: EdgeInsets.all(screenHeight * 2),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      currentPage = "COD";
                    });
                  },
                  child: SizedBox(
                    height: screenHeight * 8,
                    width: screenWidth * 40,
                    child: Card(
                      elevation: 5,
                      color: currentPage == 'COD'
                          ? AppColor.main
                          : AppColor.bright,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.money_off_csred_rounded,
                            color: currentPage == 'COD'
                                ? AppColor.bright
                                : AppColor.disabled,
                            size: screenHeight * 3.5,
                          ),
                          Text(
                            "Cash On Delivery",
                            style: TextStyle(
                              color: currentPage == 'COD'
                                  ? AppColor.bright
                                  : AppColor.disabled,
                              fontSize: screenHeight * 1.5,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentPage = "CARD";
                    });
                  },
                  child: SizedBox(
                    height: screenHeight * 8,
                    width: screenWidth * 40,
                    child: Card(
                      elevation: 5,
                      color: currentPage == 'CARD'
                          ? AppColor.main
                          : AppColor.bright,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: currentPage == 'CARD'
                                ? AppColor.bright
                                : AppColor.disabled,
                            size: screenHeight * 3.5,
                          ),
                          Text(
                            "Card",
                            style: TextStyle(
                              color: currentPage == 'CARD'
                                  ? AppColor.bright
                                  : AppColor.disabled,
                              fontSize: screenHeight * 1.5,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColor.placeholder.withOpacity(0.5),
              thickness: 1.5,
              height: 40,
            ),
            if (currentPage == 'CARD') Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Card Details",
                    style: TextStyle(
                      color: AppColor.disabled,
                      fontSize: screenHeight * 1.8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 1.5,
                ),
                TextFormField(
                  decoration: customInputDecoration(hint: 'Card Number'),
                ),
                SizedBox(
                  height: screenHeight * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 40,
                      child: TextFormField(
                        decoration: customInputDecoration(hint: 'MM/YY'),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 40,
                      child: TextFormField(
                        decoration: customInputDecoration(hint: 'CVV'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 2,
                ),
                TextFormField(
                  decoration: customInputDecoration(hint: 'Name on Card'),
                ),
                SizedBox(
                  height: screenHeight * 2,
                ),
                TextFormField(
                  decoration: customInputDecoration(hint: "Billing Address"),
                ),
                SizedBox(
                  height: screenHeight * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Save my details",
                      style: TextStyle(
                        color: AppColor.disabled,
                        fontSize: screenHeight * 1.8,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Switch(
                      value: saveDetails,
                      onChanged: (value) {
                        setState(() {
                          saveDetails = value;
                        });
                      },
                      activeTrackColor: AppColor.main,
                      activeColor: AppColor.main,
                    ),
                  ],
                ),
              ],
            ),
            if (currentPage == 'COD') Column(
              children: [
                // name
                SizedBox(
                  height: screenHeight * 1.5,
                ),
                TextFormField(
                  decoration: customInputDecoration(hint: 'Name'),
                ),
                SizedBox(
                  height: screenHeight * 1.5,
                ),
                // phone
                TextFormField(
                  decoration: customInputDecoration(hint: 'Phone'),
                ),
                SizedBox(
                  height: screenHeight * 1.5,
                ),
                // address
                TextFormField(
                  decoration: customInputDecoration(hint: 'Address'),
                ),
                SizedBox(
                  height: screenHeight * 1.5,
                ),
                // city
                TextFormField(
                  decoration: customInputDecoration(hint: 'City'),
                ),
                SizedBox(
                  height: screenHeight * 1.5,
                ),
                // state
                TextFormField(
                  decoration: customInputDecoration(hint: 'State'),
                ),
                SizedBox(
                  height: screenHeight * 1.5,
                ),
                // zip
                TextFormField(
                  decoration: customInputDecoration(hint: 'Zip'),
                ),
                SizedBox(
                  height: screenHeight * 1.5,
                ),
                // country
                TextFormField(
                  decoration: customInputDecoration(hint: 'Country'),
                ),
                SizedBox(
                  height: screenHeight * 1.5,
                ),
                // email
                TextFormField(
                  decoration: customInputDecoration(hint: 'Email'),
                ),
              ],
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   height: 50,
            //   child: ElevatedButton(
            //       onPressed: () {
            //         showModalBottomSheet(
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(20),
            //             ),
            //             isScrollControlled: true,
            //             isDismissible: false,
            //             context: context,
            //             builder: (context) {
            //               return Container(
            //                 height: Helper.getScreenHeight(context) * 0.7,
            //                 child: Column(
            //                   children: [
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: [
            //                         IconButton(
            //                           onPressed: () {
            //                             Navigator.of(context).pop();
            //                           },
            //                           icon: Icon(
            //                             Icons.clear,
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20.0),
            //                       child: Row(
            //                         children: [
            //                           Text(
            //                             "Add Credit/Debit Card",
            //                             style:
            //                                 Helper.getTheme(context).headline3,
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20.0),
            //                       child: Divider(
            //                         color:
            //                             AppColor.placeholder.withOpacity(0.5),
            //                         thickness: 1.5,
            //                         height: 40,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20.0),
            //                       child:
            //                           CustomTextInput(hintText: "card Number"),
            //                     ),
            //                     SizedBox(
            //                       height: 20,
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20.0),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text("Expiry"),
            //                           SizedBox(
            //                             height: 50,
            //                             width: 100,
            //                             child: CustomTextInput(
            //                               hintText: "MM",
            //                               padding:
            //                                   const EdgeInsets.only(left: 35),
            //                             ),
            //                           ),
            //                           SizedBox(
            //                             height: 50,
            //                             width: 100,
            //                             child: CustomTextInput(
            //                               hintText: "YY",
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       height: 20,
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20.0),
            //                       child: CustomTextInput(
            //                           hintText: "Security Code"),
            //                     ),
            //                     SizedBox(
            //                       height: 20,
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20.0),
            //                       child:
            //                           CustomTextInput(hintText: "First Name"),
            //                     ),
            //                     SizedBox(
            //                       height: 20,
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20.0),
            //                       child: CustomTextInput(hintText: "Last Name"),
            //                     ),
            //                     SizedBox(
            //                       height: 20,
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20.0),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text("You can remove this card"),
            //                           Switch(
            //                             value: false,
            //                             onChanged: (_) {},
            //                             thumbColor: MaterialStateProperty.all(
            //                               AppColor.disabled,
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       height: 30,
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 20.0),
            //                       child: SizedBox(
            //                         height: 50,
            //                         child: ElevatedButton(
            //                             onPressed: () {
            //                               Navigator.of(context).pop();
            //                             },
            //                             child: Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.center,
            //                               children: [
            //                                 Icon(
            //                                   Icons.add,
            //                                 ),
            //                                 SizedBox(width: 40),
            //                                 Text("Add Card"),
            //                                 SizedBox(width: 40),
            //                               ],
            //                             )),
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               );
            //             });
            //       },
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Icon(Icons.add),
            //           Text("Add Another Credit/Debit Card"),
            //         ],
            //       )),
            // )
          ],
        ),
      ),
    );
  }

  InputDecoration customInputDecoration({@required String hint}) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    // var screenWidth = queryData.size.width / 100;
    var screenHeight = queryData.size.height / 100;
    return InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: AppColor.placeholder,
                    fontSize: screenHeight * 1.8,
                    fontWeight: FontWeight.w300,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColor.placeholder.withOpacity(0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColor.placeholder.withOpacity(0.5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColor.placeholder.withOpacity(0.5),
                    ),
                  ),
                );
  }
}
