import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/product_model.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductModel? item;
  final VoidCallback addRemoveCallback;
  final VoidCallback? deleteFromCart;
  final Function(ProductModel?, bool) manageAddRemoveQty;
  final bool isCart;

  const ProductItemWidget(
      {required this.item, required this.addRemoveCallback, required this.manageAddRemoveQty, required this.isCart, this.deleteFromCart, super.key});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  ProductModel? get item => widget.item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
      // margin: EdgeInsets.only(bottom: index == 9 ? 50.h : 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: Color(0xFF9B9B9B)),
          top: BorderSide(color: Color(0xFF9B9B9B)),
          right: BorderSide(color: Color(0xFF9B9B9B)),
          bottom: BorderSide(width: 1, color: Color(0xFF9B9B9B)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 5.w),
                  width: 70.w,
                  height: 70.w,
                  child: CachedNetworkImageWidget(
                    imageUrl: item?.imgUrl ?? '',
                  ),
                ),
                StatefulBuilder(
                  builder: (context, innerState) {
                    return Icon(
                      // (index % 2 == 0) ? Icons.bookmark_border_rounded :
                      Icons.bookmark_rounded,
                      size: 20.sp,
                      color: item?.getIsFav ?? false ? AppColor.lightPink : AppColor.iconColor,
                    ).addGesture(
                      () {
                        item?.isFavorite = item?.getIsFav ?? false ? '0' : '1';
                        innerState(() {});
                        widget.addRemoveCallback();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(8.w).copyWith(top: 0, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.w),
                    child: Text(
                      item?.description ?? '',
                      style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.w),
                    child: Text(
                      item?.weight ?? '',
                      style: TextStyles.regular12.copyWith(color: AppColor.lightPink),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.w),
                    child: Text(
                      _getPrice(item?.dp),
                      style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.w),
                    child: Text(
                      AppLocalizations.of(context).cartonQtyWIthNo(item?.cartonNo ?? ''),
                      style: TextStyles.regular8.copyWith(color: AppColor.textSecondary),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(left: 3.w),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: const Color(0xFFE8E8E8)),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5.h).copyWith(left: 5.w),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 16.sp,
                        ),
                      ).addGesture(
                        () => widget.manageAddRemoveQty(item, false),
                      ),
                      ValueListenableBuilder(
                        valueListenable: item?.qty ?? ValueNotifier(0),
                        builder: (BuildContext context, int value, Widget? child) {
                          return SizedBox(
                            width: 55,
                            child: TextFormField(
                              maxLength: 5,
                              style: TextStyle(fontSize: 11.sp),
                              textAlign: TextAlign.center,
                              controller: item?.textController,
                              cursorColor: AppColor.black,
                              decoration: InputDecoration(
                                counterText: '',
                                hintStyle: TextStyle(fontSize: 12.sp),
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 5.r),
                                hintText: '0',
                              ),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                              ],
                              onChanged: (value) {
                                item?.qty.value = item?.textController.text.tryParseToNum.toInt() ?? 0;
                              },
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.h).copyWith(right: 5.w),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 16.sp,
                          ),
                        ),
                      ).addGesture(
                        () {
                          if (item?.isAddInCart == '1') {
                            errorToast(
                              AppLocalizations.of(context).thisProductIsAlreadyAddedInTheCart,
                              context: context,
                            );
                          } else {
                            widget.manageAddRemoveQty(item, true);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: item?.qty ?? ValueNotifier(0),
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.w),
                          child: Text(
                            '$value x ${_getPrice(item?.dp)}',
                            style: TextStyles.regular9.copyWith(color: AppColor.textSecondary),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0.w),
                          child: Text(
                            item?.getNetAmountWithCurrency ?? '',
                            style: TextStyles.semiBold12.copyWith(color: AppColor.textSecondary),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          if (widget.isCart)
            Expanded(
              flex: 1,
              child: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ).addGesture(
                () {
                  if (widget.deleteFromCart != null) widget.deleteFromCart!();
                },
              ),
            ),
          5.horizontalSpace,
        ],
      ),
    );
  }

  String _getPrice(String? dp) {
    return '${AppLocalizations.current.rupees} ${dp}';
  }
}
