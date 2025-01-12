import 'package:get/get.dart';
import 'package:task_management/services/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  var isLoading = false.obs;
  var myData = <dynamic>[].obs; // RxList olarak tanımlandı

  /// Verileri sunucudan alma işlemi
  Future<void> getData() async {
    isLoading.value = true;
    Response response = await service.getData();
    if (response.statusCode == 200) {
      myData.value = response.body; // RxList'e veri atandı
      print("we got data");
    } else {
      print("we did not get the data");
    }
    isLoading.value = false;
  }

  /// Veriyi sunucuya gönderme işlemi
  Future<void> postData(String task, String taskDetail) async {
    isLoading.value = true;
    Response response = await service.postData({
      "task_name": task,
      "task_detail": taskDetail,
    });
    if (response.statusCode == 200) {
      await getData(); // Veri eklendikten sonra verileri yeniden yükleyin
      print("we post data");
    } else {
      print("we could not post the data");
    }
    isLoading.value = false;
  }
}
