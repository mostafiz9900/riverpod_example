import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/model/info.dart';
import 'package:todo_riverpod/services/info_service.dart';

final infoProvider = FutureProvider.autoDispose
    .family<List<InfoModel>, String>((ref, uid) async {
  print(uid);
  print('print udi ');
  var services = ref.watch(infoServiceProvider);
  return services.getInfoList();
});
