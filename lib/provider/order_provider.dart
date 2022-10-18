import 'package:abctechapp/constantes.dart';
import 'package:abctechapp/model/order.dart';
import 'package:get/get.dart';

abstract class OrderProviderInterface {
  Future<Response> postOder(Order order);
}

class OrderProvider extends GetConnect implements OrderProviderInterface {
  @override
  Future<Response> postOder(Order order) =>
      post('${Contants.url}/order', order.toMap());
}
