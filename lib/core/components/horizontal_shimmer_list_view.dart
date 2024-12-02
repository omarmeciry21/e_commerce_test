import 'package:e_commerce_test/core/utils/app_box_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HorizaontalShimmerListView extends StatelessWidget {
  HorizaontalShimmerListView({
    super.key,
    this.height,
    this.width,
  });
  double? height = 85.h;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
            3,
            (index) {
              return Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.onPrimary,
                highlightColor: Colors.black54,
                direction: ShimmerDirection.rtl,
                child: Container(
                  height: height,
                  width: width ?? 188.w,
                  padding: EdgeInsets.only(left: 8.w, right: 4.w),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: AppBoxShadows.normalShadow),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
