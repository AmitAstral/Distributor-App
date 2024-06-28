import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/distributor_model.dart';
import 'package:distributor_empower/presentation/base_statefull_widget.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartConfirmationDialog extends BaseStatefulWidget {
  final Function(DistributorModel? item, String? Remark) yes;
  final List<DistributorModel?> distributorList;

  const CartConfirmationDialog({required this.yes, required this.distributorList, super.key});

  @override
  BaseState<CartConfirmationDialog> createState() => _CartConfirmationDialogState();
}

class _CartConfirmationDialogState extends BaseState<CartConfirmationDialog> {
  DistributorModel? _selectedItem;
  bool isError = false;
  TextEditingController remarkController = TextEditingController();

  @override
  Widget buildBody(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.verticalSpace,
            Text(
              AppLocalizations.of(context).areYouSureYouWantToConfirmOnceConfirmedIt,
              style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
            ),
            10.verticalSpace,
            Center(
              child: DropdownButton<DistributorModel?>(
                isExpanded: true,
                isDense: true,
                value: _selectedItem,
                hint: Text(AppLocalizations.current.selectShipmentToDealer),
                onChanged: (newValue) {
                  setState(() {
                    _selectedItem = newValue;
                    isError = false;
                  });
                },
                items: widget.distributorList.map((item) {
                  return DropdownMenuItem<DistributorModel>(
                    alignment: Alignment.centerLeft,
                    value: item,
                    child: Text(item?.text ?? ''),
                  );
                }).toList(),
              ),
            ),
            Visibility(
              visible: _selectedItem != null,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  AppLocalizations.current.addressSelecteditemaddress(_selectedItem?.text ?? ''),
                  style: TextStyles.semiBold13.copyWith(color: AppColor.textSecondary),
                ),
              ),
            ),
            Visibility(
              visible: isError,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context).pleaseSelectShipmentToDealer,
                  style: TextStyles.regular11.copyWith(color: AppColor.red),
                ),
              ),
            ),
            10.verticalSpace,
            AppTextFormField(hintText: AppLocalizations.of(context).remarks, controller: remarkController),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                  ),
                  onPressed: () {
                    if (_selectedItem != null) {
                      appRouter.maybePop();
                      widget.yes(_selectedItem!, remarkController.text);
                    } else {
                      setState(() {
                        isError = true;
                      });
                    }
                  },
                  child: Text(
                    AppLocalizations.current.yes,
                    style: TextStyles.semiBold13,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () {
                    appRouter.maybePop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      AppLocalizations.current.no,
                      style: TextStyles.semiBold13,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
