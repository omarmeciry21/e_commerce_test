import 'package:e_commerce_test/core/utils/app_box_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class VerticalShimmerListView extends StatelessWidget {
  VerticalShimmerListView(
      {super.key, this.height, this.fromTopOffset, this.itemCount});
  double? height = 85.h;
  double? fromTopOffset = 0.0.h;
  int? itemCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: fromTopOffset,
            ),
            ...List.generate(
              itemCount ?? 10,
              (index) {
                return Shimmer.fromColors(
                    baseColor: Colors.black54.withOpacity(0.75),
                    highlightColor: Colors.black54,
                    direction: ShimmerDirection.rtl,
                    child: Container(
                      height: height,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      margin: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                          color: Colors.black54.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: AppBoxShadows.normalShadow),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
