import 'package:ecommerce_hptshop/routes/app_routes.dart';
import 'package:ecommerce_hptshop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ecommerce_hptshop/utils/constants/text_strings.dart';
import 'package:ecommerce_hptshop/utils/theme/theme.dart';
import 'bindings/general_bindings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: HptTexts.appName,
        themeMode: ThemeMode.system,
        theme: HptAppTheme.lightTheme,
        darkTheme: HptAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBindings(),
        getPages: AppRoutes.pages,
        home: const Scaffold(backgroundColor: HptColors.primary, body: Center(child: CircularProgressIndicator(color: HptColors.white))));
  }
}
