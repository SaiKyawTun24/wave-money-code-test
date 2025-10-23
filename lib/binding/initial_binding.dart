import 'package:get/get.dart';
import 'package:wave_money_code_test/binding/repository_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBinding().dependencies();
  }
}