import 'package:get/get_connect.dart';
import '../constantes.dart';

abstract class AssistProviderInterface {
  Future<Response> getAssists();
}

class AssistProvider extends GetConnect implements AssistProviderInterface {
  @override
  Future<Response> getAssists() => get('${Contants.url}/assistance');
}
