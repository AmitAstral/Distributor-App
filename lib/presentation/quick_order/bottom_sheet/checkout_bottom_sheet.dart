import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/presentation/quick_order/bottom_sheet/product_list_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutBottomSheet {
  static void checkoutBottomSheetWidget({
    required String? subGroupId,
    required bool isCart,
  }) {
    showModalBottomSheet(
      context: appContext,
      isScrollControlled: true,
      useRootNavigator: true,
      useSafeArea: true,
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      ),
      builder: (context) {
        return ProductListDialog(
          subGroupId: subGroupId ?? '',
          isCart: isCart,
        );
      },
    );
  }
}
