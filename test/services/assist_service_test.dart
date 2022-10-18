import 'dart:convert';
import 'dart:io';

import 'package:abctechapp/model/assist.dart';
import 'package:abctechapp/provider/assist_provider.dart';
import 'package:abctechapp/service/assist_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'assist_service_test.mocks.dart';

@GenerateMocks([AssistProviderInterface])
void main() {
  late AssistService service;
  late AssistProviderInterface provider;

  setUp(() async {
    provider = MockAssistProviderInterface();
    // ignore: await_only_futures
    service = await AssistService(assistProvider: provider);

    String json =
        File('${Directory.current.path}/test/resources/assist_response.json')
            .readAsStringSync();

    when(provider.getAssists()).thenAnswer((_) async => Future.sync(
        () => Response(statusCode: HttpStatus.ok, body: jsonDecode(json))));
  });

  test('Testando tamanho da lista', () async {
    List<Assist> lista = await service.getAssists();
    expect(lista.length, 15);
  });

  test('Testando o retorno da lista da posição 0', () async {
    List<Assist> lista = await service.getAssists();
    expect(lista[0].id, 1);
    expect(lista[0].name, 'Manutenção 1');
    expect(lista[0].description, 'Descrição 1');
  });
  test('Testando o retorno da lista da posição 1', () async {
    List<Assist> lista = await service.getAssists();
    expect(lista[0].id, 2);
    expect(lista[0].name, 'Manutenção 2');
    expect(lista[0].description, 'Descrição 2');
  });
}
