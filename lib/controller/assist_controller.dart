import 'package:abctechapp/model/assist.dart';
import 'package:abctechapp/service/assist_service.dart';
import 'package:get/get.dart';

class AssistController extends GetxController with StateMixin<List<Assist>> {
  late AssistService _service;
  List<Assist> allAssists = [];
  List<Assist> selectAssists = [];

  @override
  void onInit() {
    super.onInit();
    _service = Get.find<AssistService>();
    GetAssistList();
  }

  void GetAssistList() {
    change([], status: RxStatus.loading());
    _service.getAssists().then((value) {
      allAssists = value;
      change(value, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change([], status: RxStatus.error(error.toString()));
    });
  }

  bool isSelected(int index) {
    Assist assistamce = allAssists[index];
    int indexFound =
        selectAssists.indexWhere((element) => element.id == assistamce.id);
    if (indexFound >= 0) {
      return true;
    } else {
      return false;
    }
  }

  void selectAssist(int index) {
    Assist assistamce = allAssists[index];
    int indexFound =
        selectAssists.indexWhere((element) => element.id == assistamce.id);
    if (indexFound == -1) {
      selectAssists.add(assistamce);
    } else {
      selectAssists.removeAt(indexFound);
    }
    change(allAssists, status: RxStatus.success());
  }

  void finishSelectAssist() {
    Get.back();
  }
}
