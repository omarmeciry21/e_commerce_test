import 'package:e_commerce_test/core/components/custom_cached_network_image.dart';
import 'package:e_commerce_test/core/utils/app_box_shadows.dart';
import 'package:e_commerce_test/features/orders/data/models/order_models.dart';
import 'package:e_commerce_test/features/orders/presentation/widgets/tags_wrap_widget.dart';
import 'package:e_commerce_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOrderListTile extends StatelessWidget {
  const CustomOrderListTile({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final first3Tags = order.tags?.take(5).toList() ?? [];
    if ((order.tags?.length ?? 0) > 5) {
      first3Tags.add("...");
    }
    return Container(
      // height: 109.h,
      margin: EdgeInsets.symmetric(horizontal: 16.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: AppBoxShadows.normalShadow,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: CustomCachedNetworkImage(
                imageUrl: order.picture ?? "",
                width: 129.w,
                height: 109.h,
                fit: BoxFit.cover,
                borderRadius: 4.r,
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.company ?? "",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${S.of(context).buyer}: ${order.buyer ?? ""}",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TagsWrapWidget(tags: first3Tags),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      order.price ?? "",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
