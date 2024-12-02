import 'package:bloc/bloc.dart';
import 'package:e_commerce_test/features/orders/data/models/order_models.dart';
import 'package:e_commerce_test/features/orders/data/repo/orders_repo.dart';
import 'package:meta/meta.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit({
    required this.ordersRepo,
  }) : super(GetOrdersInitial());

  OrdersRepo ordersRepo;

  void getOrders() async {
    emit(GetOrdersLoading());
    final orders = await ordersRepo.getOrders();
    orders.fold(
      (failure) => emit(GetOrdersFailure(failure.errMessage)),
      (orders) => emit(GetOrdersSuccess(orders)),
    );
  }
}
