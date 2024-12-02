import 'package:e_commerce_test/core/routing/app_routes.dart';
import 'package:e_commerce_test/core/service_locator.dart';
import 'package:e_commerce_test/features/orders/data/repo/orders_repo.dart';
import 'package:e_commerce_test/features/orders/presentation/cubit/get_orders_cubit.dart';
import 'package:e_commerce_test/features/orders/presentation/views/orders_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: AppRoutes.ordersView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetOrdersCubit(
              ordersRepo: getIt.get<OrdersRepo>(),
            ),
          ),
        ],
        child: OrdersView(),
      ),
    ),
  ]);
}
