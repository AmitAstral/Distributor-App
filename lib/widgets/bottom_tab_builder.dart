import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';

class BottomTabBuilder extends DelegateBuilder {
  @override
  Widget build(BuildContext context, int index, bool active) {
    return active && BottomBarNavigationProvider().currentIndex == index
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: AppColor.primaryColor, borderRadius: BorderRadius.circular(100)),
                padding: const EdgeInsets.all(6),
                child: Icon(
                  BottomNavigationEnum.values[index].icon,
                  color: active ? AppColor.white : AppColor.grey,
                  size: 28,
                ),
              ),
              Text(
                BottomNavigationEnum.values[index].label ?? '',
                style: TextStyles.semiBold12.copyWith(color: active ? AppColor.primaryColor : AppColor.grey),
              ),
            ],
          )
        : Icon(
            BottomNavigationEnum.values[index].icon,
            color: AppColor.grey,
            size: 24,
          );
  }
}
