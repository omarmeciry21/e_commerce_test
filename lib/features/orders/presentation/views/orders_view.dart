import 'package:e_commerce_test/core/components/custom_error_handling_widget.dart';
import 'package:e_commerce_test/core/components/vertical_shimmer_list_view.dart';
import 'package:e_commerce_test/features/orders/presentation/cubit/get_orders_cubit.dart';
import 'package:e_commerce_test/features/orders/presentation/widgets/custom_order_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  void initState() {
    super.initState();

    context.read<GetOrdersCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: SafeArea(child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
          builder: (context, state) {
            if (state is GetOrdersFailure) {
              return CustomErrorHandlingWidget(
                  errorMessage: state.message,
                  onRetryPressed: () {
                    context.read<GetOrdersCubit>().getOrders();
                  });
            }
            if (state is GetOrdersSuccess) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomOrderListTile(
                      order: state.orders[index],
                    );
                  },
                  separatorBuilder: (_, __) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemCount: state.orders.length);
            }

            return VerticalShimmerListView();
          },
        )));
  }
}
