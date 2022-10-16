// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:abctechapp/model/order_location.dart';

class Oder {
  int operatorId = 0;
  List<int> Assists = [];
  OderLocation? start;
  OderLocation? end;
  Oder({
    required this.operatorId,
    required this.Assists,
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'operatorId': operatorId,
      'Assists': Assists,
      'start': start?.toMap(),
      'end': end?.toMap()
    };
  }

  String toJson() => json.encode(toMap());
}
