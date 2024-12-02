import 'package:e_commerce_test/core/cubit/language_cubit.dart';
import 'package:e_commerce_test/core/utils/app_box_shadows.dart';
import 'package:e_commerce_test/generated/l10n.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_test/features/orders/data/models/order_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; // To format the date

class OrderStatsLineChart extends StatelessWidget {
  final List<OrderModel> orders;

  const OrderStatsLineChart({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    // Group orders by day and calculate income
    final Map<String, List<OrderModel>> ordersByDate = {};

    for (var order in orders) {
      if (order.registered != null) {
        final date =
            '${order.registered!.year}-${order.registered!.month.toString().padLeft(2, '0')}-${order.registered!.day.toString().padLeft(2, '0')}';
        if (ordersByDate.containsKey(date)) {
          ordersByDate[date]!.add(order);
        } else {
          ordersByDate[date] = [order];
        }
      }
    }

    // Prepare data for the chart (number of orders)
    List<FlSpot> orderCounts = [];
    List<String> orderDates = []; // To store formatted dates
    int index = 0;

    ordersByDate.forEach((date, ordersOnDay) {
      orderCounts.add(FlSpot(index.toDouble(), ordersOnDay.length.toDouble()));
      orderDates.add(date);
      index++;
    });

    // Function to get formatted date every 5 days
    String getDateLabel(String date, int index) {
      DateTime parsedDate = DateTime.parse(date);
      if (index % 5 == 0) {
        return DateFormat('dd/MM').format(parsedDate);
      }
      return '';
    }

    return Container(
      height: 225.h,
      margin: EdgeInsets.all(16.0.r),
      padding: EdgeInsets.all(16.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: AppBoxShadows.normalShadow,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: true),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: context
                        .read<LanguageCubit>()
                        .languageCode
                        .toLowerCase() ==
                    "en"
                ? AxisTitles(
                    sideTitles:
                        const SideTitles(showTitles: true, reservedSize: 32),
                    axisNameWidget: Text(S.of(context).totalOrders))
                : const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              axisNameWidget: Text(S.of(context).date),
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  // Show only every 5th day
                  if (value.toInt() >= 0 && value.toInt() < orderDates.length) {
                    final dateString = orderDates[value.toInt()];
                    return Text(
                      getDateLabel(
                          dateString, value.toInt()), // Show every 5th date
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    );
                  }
                  return const SizedBox(); // Return an empty widget if index is out of range
                },
              ),
            ),
            // Hide top and right titles
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: context
                        .read<LanguageCubit>()
                        .languageCode
                        .toLowerCase() ==
                    "ar"
                ? AxisTitles(
                    sideTitles:
                        const SideTitles(showTitles: true, reservedSize: 32),
                    axisNameWidget: Text(S.of(context).totalOrders))
                : const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false), // Remove chart borders
          lineBarsData: [
            LineChartBarData(
              spots: orderCounts,
              // isCurved: true,
              color: Theme.of(context).primaryColor,
              belowBarData: BarAreaData(show: false),
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
