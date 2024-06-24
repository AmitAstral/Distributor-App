import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.current.noDataFound,
        style: TextStyles.semiBold16.copyWith(
          color: AppColor.textSecondary,
        ),
      ),
    );
  }
}
