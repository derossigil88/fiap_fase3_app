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
        itemBuilder: ((context, index) =>
            ListTile(title: Text(assist[index].name))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Serviços: '),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const [
                Expanded(
                    child: Text(
                  'Serviços disponíveis: ',
                  textAlign: TextAlign.center,
                ))
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
            controller.obx((state) => renderAssist(state ?? []),
                onEmpty: const Image(
                    image: NetworkImage(
                        'https://media.tenor.com/9ud1r4sc-QQAAAAM/confused-john-travolta.gif')),
                onError: (error) => Text(error.toString()),
                onLoading: const Image(
                    image: NetworkImage(
                        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a2c21d7e-02b8-430c-b6a8-255189077a5a/d6i89u6-1957aee4-8182-4a53-8df5-a8a300498751.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2EyYzIxZDdlLTAyYjgtNDMwYy1iNmE4LTI1NTE4OTA3N2E1YVwvZDZpODl1Ni0xOTU3YWVlNC04MTgyLTRhNTMtOGRmNS1hOGEzMDA0OTg3NTEuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.6JT-iH4XiEArLL2pStH73HKWHnUqVNrSDiCTlkQFZqA'))),
          ],
        ),
      ),
    );
  }
}
