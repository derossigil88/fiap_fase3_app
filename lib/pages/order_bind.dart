import 'package:abctechapp/controller/order_controller.dart';
import 'package:abctechapp/provider/order_provider.dart';
import 'package:abctechapp/service/geolocation_service.dart';
import 'package:abctechapp/service/order_service.dart';
import 'package:get/get.dart';

class OrderBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController(GeolocationService),
        OrderService(OrderProvider()));
  }
}
