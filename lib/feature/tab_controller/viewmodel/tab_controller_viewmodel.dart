import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:budgetbuddy/core/enums/padding/padding_enums.dart';
import 'package:budgetbuddy/core/enums/radius/radius_enums.dart';
import 'package:budgetbuddy/product/constants/bottom_nav_bar/nav_bar_constants.dart';
import 'package:budgetbuddy/product/init/localization/locale_keys.g.dart';
import 'package:budgetbuddy/product/init/localization/localizaton_manager.dart';

import '../../../core/constants/app/app_constants.dart';

part '../view/tab_controller_view.dart';

abstract class TabControllerViewModel extends State<TabControllerView>
    with BottomNavBarConstants {
  int currentIndex = 0;
}
