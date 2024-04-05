import 'package:airbnb/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/binding/initial_binding.dart';
import 'helpers/helpers.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orient, type) {

          return GetMaterialApp(
            title: kAppName,
            theme: MyThemApp.themeData(context),
            debugShowCheckedModeBanner: false,
            // translations: MyTranslation(),
            // locale: Get.deviceLocale,
            textDirection: TextDirection.ltr,
            initialBinding: InitialBinding(),
            initialRoute: '/',
            getPages: routes,
          );
        }
    );
  }
}
