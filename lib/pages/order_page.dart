import 'package:abctechapp/controller/order_controller.dart';
import 'package:abctechapp/model/assist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  Widget renderAssists(List<Assist> assists) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: assists.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(assists[index].name)));
  }

  Widget buildForm(BuildContext context) {
    return SingleChildScrollView(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(children: const [
            Expanded(
                child: Text(
              'Prencher o formulário',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ))
          ]),
          TextFormField(
            controller: controller.operatorIdController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(labelText: 'Código do prestrador'),
            textAlign: TextAlign.center,
          ),
          Row(children: [
            const Expanded(
                child: Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      'Selecione os serviços a serem prestados',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ))),
            Ink(
              decoration: const ShapeDecoration(
                  shape: CircleBorder(), color: Colors.deepOrange),
              // ignore: sort_child_properties_last
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () => controller.editAssists(),
              ),
              width: 40,
              height: 40,
            )
          ]),
          Obx(
            () => renderAssists(controller.selectedAssists),
          ),
          Row(children: [
            Expanded(
                child: ElevatedButton(onPressed: () {
              FocusScope.of(context).unfocus();
              controller.finishStartOrder();
            }, child: Obx((() {
              if (controller.screenState.value == OrderState.creating) {
                return const Text("Inicar serviço");
              } else {
                return const Text("Finalizar serviço");
              }
            }))))
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Ordem de Serviço')),
        body: Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.all(10.0),
            child: Container(
              constraints: const BoxConstraints.expand(),
              child: controller.obx((state) => buildForm(context)),
            )));
  }
}
