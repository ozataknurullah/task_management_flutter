import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData() async {
    Response response = await get(
      "http://10.0.2.2:8082/gettasks",
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    return response;
  }

  Future<Response> postData(dynamic body) async {
    Response response = await post(
      "http://10.0.2.2:8082/create",
      body,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    return response;
  }
}
