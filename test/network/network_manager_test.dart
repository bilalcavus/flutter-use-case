import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_use_case/core/data/model/user.dart';
import 'package:flutter_use_case/product/service/manager/product_service_manager.dart';
import 'package:flutter_use_case/product/service/manager/service_path.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ProductNetworkManager manager;
  setUp(() async {
    await dotenv.load(fileName: "assets/config/.dev.env");
    manager = ProductNetworkManager.base();
  });

  test('get users items from api', () async {
    final response = await manager.send<User, List<User>>(
      ProductServicePath.userV1.value,
      parseModel: User(),
      method: RequestType.GET);

      expect(response.data, isNotNull);
  });

  test('get users items from api with error', () async {
    manager.listenErrorState(onErrorStatus: (value) {
      if(value == HttpStatus.unauthorized){}
      expect(value, isNotNull);
    });
    final response = await manager.send<User, List<User>>(
      ProductServicePath.usersV2.value,
      parseModel: User(),
      method: RequestType.GET);

      expect(response.data, null);
  });
}