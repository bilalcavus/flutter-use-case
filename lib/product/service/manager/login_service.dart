import 'package:flutter_use_case/core/data/model/user.dart';
import 'package:flutter_use_case/product/service/manager/service_path.dart';
import 'package:vexana/vexana.dart';

final class LoginService {
  LoginService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  Future<List<User>> users() async {
    final response = await _networkManager.send<User, List<User>>(
      ProductServicePath.userV1.value,
      parseModel: User(),
      method: RequestType.GET
    );
    
    return response.data ?? []; 
  }
}

///#v2b10