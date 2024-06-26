import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/ageing_model.dart';
import 'package:distributor_empower/presentation/ageing/ageing_provider.dart';
import 'package:distributor_empower/presentation/base_statefull_widget.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AgeingScreen extends BaseStatefulWidget {
  const AgeingScreen({super.key});

  @override
  BaseState<AgeingScreen> createState() => _AgeingScreenState();
}

class _AgeingScreenState extends BaseState<AgeingScreen> {
  final _ageingProvider = AgeingProvider();

  @override
  void initState() {
    _ageingProvider.callAgeingReport();
    super.initState();
  }

  @override
  void dispose() {
    _ageingProvider.dispose();
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          title: Text(
            AppLocalizations.of(context).ageing,
            maxLines: 1,
            style: TextStyles.semiBold15,
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: _ageingProvider,
        child: Consumer<AgeingProvider>(
          builder: (context, value, child) {
            return _buildView();
          },
        ),
      ),
    );
  }

  Widget _buildView() {
    final responseData = _ageingProvider.ageingDetailsResponse;
    if (_ageingProvider.isLoading.value) {
      return const ProgressWidget(
        inAsyncCall: true,
        opacity: 0,
        child: SizedBox.shrink(),
      );
    } else if (responseData != null) {
      return _buildDetailsView(responseData);
    } else {
      return const NoDataFoundWidget();
    }
  }

  Widget _buildDetailsView(AgeingResponse? responseData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        8.verticalSpace,
        _buildValueWidget(AppLocalizations.current.creditLimit, responseData?.creditLimit ?? '0'),
        _buildValueWidget(AppLocalizations.of(context).currentBalance, responseData?.balance ?? '0'),
        _buildValueWidget(AppLocalizations.of(context).availableCredit, responseData?.availableCredit ?? '0'),
        8.verticalSpace,
        Divider(color: AppColor.grey.withOpacity(0.5), height: 1),
        8.verticalSpace,
        _buildRangeValues(responseData?.lbl1 ?? '', responseData?.lblBal1 ?? ''),
        _buildRangeValues(responseData?.lbl2 ?? '', responseData?.lblBal2 ?? ''),
        _buildRangeValues(responseData?.lbl3 ?? '', responseData?.lblBal3 ?? ''),
        _buildRangeValues(responseData?.lbl4 ?? '', responseData?.lblBal4 ?? ''),
        _buildRangeValues(responseData?.lbl5 ?? '', responseData?.lblBal5 ?? ''),
        _buildRangeValues(responseData?.lbl6 ?? '', responseData?.lblBal6 ?? ''),
        _buildRangeValues(responseData?.lbl7 ?? '', responseData?.lblBal7 ?? ''),
        _buildRangeValues(responseData?.lbl8 ?? '', responseData?.lblBal8 ?? ''),
      ],
    );
  }

  Row _buildRangeValues(String displayName, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.only(bottom: 8),
          constraints: const BoxConstraints(minWidth: 100),
          child: Text(displayName, style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary)),
        ),
        Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.only(bottom: 8),
          child: const Text(':', style: TextStyle(fontSize: 15)),
        ),
        15.horizontalSpace,
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: AppColor.grey),
          ),
          margin: const EdgeInsets.only(bottom: 8),
          alignment: Alignment.centerLeft,
          constraints: const BoxConstraints(minWidth: 90),
          child: Center(
            child: Text(
              value,
              style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildValueWidget(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColor.primaryColorLight,
            borderRadius: BorderRadius.all(
              const Radius.circular(5).r,
            ),
          ),
          constraints: const BoxConstraints(minWidth: 130),
          child: Text(
            title,
            style: TextStyles.regular13,
          ),
        ),
        10.horizontalSpace,
        Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColor.primaryColorLight,
            borderRadius: BorderRadius.all(
              const Radius.circular(5).r,
            ),
          ),
          constraints: const BoxConstraints(minWidth: 130),
          child: Center(
            child: Text(
              value,
              style: TextStyles.regular13,
            ),
          ),
        ),
      ],
    );
  }
}
