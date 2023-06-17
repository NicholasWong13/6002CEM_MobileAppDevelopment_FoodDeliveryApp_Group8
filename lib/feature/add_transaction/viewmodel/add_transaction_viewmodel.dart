import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:budgetbuddy/core/enums/padding/padding_enums.dart';
import 'package:budgetbuddy/core/theme/color_scheme/color_scheme.dart';
import 'package:budgetbuddy/product/widgets/buttons/calendar_button/calendar_button.dart';
import 'package:budgetbuddy/core/components/formfield/custom_formfield.dart';
import 'package:budgetbuddy/core/components/text_tr/text_tr.dart';

import '../../../product/init/localization/locale_keys.g.dart';
import '../../../product/widgets/buttons/add_transaction_button.dart/button_widget.dart';

part '../view/add_transaction_view.dart';

abstract class AddTransactionViewModel extends State<AddTransactionView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate = DateTime.now();
  bool isExpense = true;
}
