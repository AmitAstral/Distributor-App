import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';

class FilterMenuWidget extends StatefulWidget {
  final List<FilterData>? filter;
  final String title;
  final Function(FilterData) onChangeDivision;

  const FilterMenuWidget(this.filter, this.title, this.onChangeDivision, {super.key});

  @override
  State<FilterMenuWidget> createState() => _FilterMenuWidgetState();
}

class _FilterMenuWidgetState extends State<FilterMenuWidget> {
  FilterData get getSelectedItem =>
      widget.filter?.firstWhere(
        (element) => element.divisionID == storage.userDetails.divisionID,
      ) ??
      FilterData();

  @override
  Widget build(BuildContext context) {
    if (widget.filter?.isEmpty ?? true) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10).w,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5).w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8).r,
        boxShadow: [
          BoxShadow(
            color: const Color(0x260A04B1),
            blurRadius: 20.r,
            offset: const Offset(0, 2),
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        children: [
          _buildPopupMenu,
          const Spacer(),
          Text(
            AppLocalizations.of(context).sapcodeTitle(getSelectedItem.sapCode ?? ''),
            style: TextStyles.semiBold11.copyWith(
              color: AppColor.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildPopupMenu {
    return PopupMenuButton<FilterData>(
      initialValue: getSelectedItem,
      child: Row(
        children: [
          5.horizontalSpace,
          Text(
            getSelectedItem.label ?? '',
            style: TextStyles.semiBold12.copyWith(
              color: AppColor.textSecondary,
            ),
          ),
          5.horizontalSpace,
          Icon(
            Icons.arrow_drop_down_sharp,
            size: 20.h,
            color: AppColor.textSecondary,
          )
        ],
      ),
      itemBuilder: (context) {
        return List.generate(
          widget.filter?.length ?? 0,
          (index) => PopupMenuItem(
            child: Text(widget.filter?[index].label ?? ''),
            onTap: () {
              final userData = storage.userDetails;
              userData.divisionID = widget.filter?[index].divisionID;
              userData.distributorSapCode = widget.filter?[index].sapCode;
              storage.userDetails = userData;
              widget.onChangeDivision(getSelectedItem);
            },
          ),
        );
      },
    );
  }
}
