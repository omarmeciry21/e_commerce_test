import 'package:e_commerce_test/core/utils/app_box_shadows.dart';
import 'package:e_commerce_test/features/orders/data/models/order_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class OrdersNumbersCards extends StatelessWidget {
  const OrdersNumbersCards({super.key, required this.orders});
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    final averagePrice = (orders
                .map((e) => e.price != null && e.price!.isNotEmpty
                    ? double.tryParse(
                            e.price!.replaceAll(RegExp(r'[^\d.]'), '')) ??
                        0
                    : 0)
                .reduce((a, b) => a + b) /
            orders.length)
        .toStringAsFixed(2);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: buildSingleCard(
              context,
              'Total Orders',
              orders.length.toString(),
              Iconsax.box,
            ),
          ),
          SizedBox(
            width: 10.r,
          ),
          Expanded(
            child: buildSingleCard(
              context,
              'Average Price',
              '\$$averagePrice',
              Iconsax.dollar_circle,
            ),
          ),
          SizedBox(
            width: 10.r,
          ),
          Expanded(
            child: buildSingleCard(
              context,
              'Number of Returns',
              orders.where((e) => e.status == "RETURNED").length.toString(),
              Iconsax.truck,
            ),
          ),
        ],
      ),
    );
  }

  Container buildSingleCard(
          context, String title, String number, IconData icon) =>
      Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: AppBoxShadows.normalShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(title,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(number,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                )
              ],
            )
          ],
        ),
      );
}
