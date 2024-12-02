import 'package:e_commerce_test/core/network/api_service.dart';
import 'package:e_commerce_test/features/orders/data/repo/orders_repo.dart';
import 'package:e_commerce_test/features/orders/data/repo/orders_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      baseUrl: "",
    ),
  );
  getIt.registerSingleton<OrdersRepo>(OrdersRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));
}
