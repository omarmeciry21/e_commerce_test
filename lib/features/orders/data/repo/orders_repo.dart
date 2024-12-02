import 'package:dartz/dartz.dart';
import 'package:e_commerce_test/core/network/failures.dart';
import 'package:e_commerce_test/features/orders/data/models/order_models.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderModel>>> getOrders();
}
