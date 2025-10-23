import 'package:get/get.dart';
import '../app/data/repository/repository.dart';
import '../app/data/repository/repository_impl.dart';

class RepositoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Repository>(
      RepositoryImpl(),
      tag: (Repository).toString(),
    );
  }
}