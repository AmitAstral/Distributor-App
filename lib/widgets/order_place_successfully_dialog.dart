import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderPlaceSuccessfullyDialog extends StatelessWidget {
  const OrderPlaceSuccessfullyDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 6,
                child: Lottie.asset(Assets.lotties.addToCart, alignment: Alignment.center),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Order Place Successfully',
                  style: TextStyles.semiBold16,
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                  ),
                  onPressed: () {
                    AutoRouter.of(context).maybePopTop();
                  },
                  child: Text(
                    AppLocalizations.of(context).ok,
                    style: TextStyles.semiBold13,
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
