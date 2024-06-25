import 'package:life_app/http/request/base_request.dart';

class HiNet {
  //静态属性——该类的实例
  static HiNet? _instance;
  // 私有构造函数，防止外部直接创建实例
  HiNet._internal() {
    // 这里可以执行一些初始化操作
  }
  // 工厂构造函数，用于获取单例实例
  factory HiNet.getInstance() {
    // 如果_instance还未被初始化，则创建实例
    _instance ??= HiNet._internal();
    // 返回已有的单例实例
    return _instance!;
  }

  Future fire(BaseRequest request) async {
    var response = await send(request);

    var result = response['data'];
    print(result);
    return result;
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    print('url:${request.url()}');
    print("method:${request.httpMethod()}");
    request.addHeader('token', '123');
    print('header:${request.header}');

    return Future.value({
      "statusCode": 200,
      "data": {'code': 0, "message": 'success'}
    });
  }
}
