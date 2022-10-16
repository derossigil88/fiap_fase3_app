// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:abctechapp/model/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/order_created.dart';
import '../provider/order_provider.dart';

abstract class OrderServiceInterface {
  Future<OrderCreated> createOrder(Order order);
}

class OrderService extends GetxService implements OrderServiceInterface {
  final OrderProviderInterface _orderProviderInterface;
  OrderService(this._orderProviderInterface);

  @override
  Future<OrderCreated> createOrder(Order order) async {
    Response response = await _orderProviderInterface.postOder(order);
    if (response.hasError) {
      return Future.error(ErrorDescription('Erro na conexão'));
    }
    try {
      return Future.sync(() => OrderCreated(true, ""));
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription("Erro não esperado"));
    }
  }
}
