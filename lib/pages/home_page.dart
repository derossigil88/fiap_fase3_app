import 'package:abctechapp/controller/assist_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../model/assist.dart';

class HomePage extends GetView<AssistController> {
  Widget renderAssist(List<Assist> assist) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: assist.length,
        itemBuilder: ((context, index) => ListTile(
              title: Text(assist[index].name),
              selectedColor: Colors.deepPurple,
              selected: controller.isSelected(index),
              onTap: () => controller.selectAssist(index),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Serviços: '),
      ),
      body: Container(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: const [
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text('Serviços disponíveis:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: controller.GetAssistList,
                      child: const Text('Recarregar'),
                    ))
                  ],
                ),
                controller.obx(
                  (state) => renderAssist(state ?? []),
                  onEmpty: const Image(
                      image: NetworkImage(
                          'https://media.tenor.com/9ud1r4sc-QQAAAAM/confused-john-travolta.gif')),
                  onError: (error) => Text(error.toString()),
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () => controller.finishSelectAssist(),
          child: const Icon(Icons.done)),
    );
  }
}
