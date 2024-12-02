import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_test/core/mock_data/orders_json_mock_data.dart';
import 'package:e_commerce_test/core/network/api_service.dart';
import 'package:e_commerce_test/core/network/failures.dart';
import 'package:e_commerce_test/features/orders/data/models/order_models.dart';
import 'package:e_commerce_test/features/orders/data/repo/orders_repo.dart';
import 'package:e_commerce_test/generated/l10n.dart';

class OrdersRepoImpl extends OrdersRepo {
  final ApiService apiService;

  OrdersRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      final List<OrderModel> ordersList = [];
      // final ordersJson = await ApiService(baseUrl: ApiService.BASE_URL_STAGE)
      //     .get(endPoint: '/orders');
      for (var order in kOrdersJson) {
        ordersList.add(OrderModel.fromJson(order));
      }

      return Future.value(right(ordersList));
    } catch (e) {
      if (e is DioException) {
        return Future.value(left(ServerFailure.fromDioError(e)));
      } else {
        return Future.value(left(ServerFailure(S.current.exceptionMessage)));
      }
    }
  }
}
