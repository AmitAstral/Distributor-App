import 'package:distributor_empower/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductShimmerWidget extends StatefulWidget {
  const ProductShimmerWidget({super.key});

  @override
  State<ProductShimmerWidget> createState() => _ProductShimmerWidgetState();
}

class _ProductShimmerWidgetState extends State<ProductShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).w,
            child: const ShimmerEffect.rectangular(
              height: 50,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 7).w,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 18).h,
                  //  height: MediaQuery.of(context).size.height * 0.055,
                  alignment: Alignment.center,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.14,
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 14,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        // height: 50,
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 1, offset: const Offset(0, 1)),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: ClipRRect(borderRadius: BorderRadius.circular(6), child: ShimmerEffect.rectangular(height: 20.h)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }
}
