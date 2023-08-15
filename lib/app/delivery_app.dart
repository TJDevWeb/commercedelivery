import 'package:commdelivery/app/core/ui/theme/theme_config.dart';
import 'package:commdelivery/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryApp extends StatelessWidget {

  const DeliveryApp({ super.key });

   @override
   Widget build(BuildContext context) {
       return GetMaterialApp(
        title: 'Commerce Delivery',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        enableLog: true,
        //logWriterCallback: Logger.write,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        //locale: TranslationService.locale,
        //fallbackLocale: TranslationService.fallbackLocale,
        //translations: TranslationService(),
       );
  }
}