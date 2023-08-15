import 'package:commdelivery/app/core/ui/helpers/loader.dart';
import 'package:commdelivery/app/core/ui/helpers/messages.dart';
import 'package:commdelivery/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with Loader, Messages {

  final _loading = false.obs;
  final _message = Rxn<MessagesModel>();

  @override
  void onInit() {
    super.onInit();
    showLoader(_loading);
    messageListener(_message);
  }

  Future<void> acessar() async {
    _loading(true);
    await Future.delayed(const Duration(seconds: 3));
    _loading(false);
    //message(MessagesModel(title: 'Erro', message: 'Mensagem', type: MessageType.success));
    //await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.HOME);
  }

}