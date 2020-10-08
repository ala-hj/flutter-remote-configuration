import 'package:get/get.dart';
import 'package:remote_application/binding/chapters_binding.dart';

import 'package:remote_application/binding/initial_bindings.dart';
import 'package:remote_application/pages/views/chapters_view.dart';

import 'package:remote_application/pages/views/home_view.dart';
import 'package:remote_application/pages/web_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITAL = Routes.HOME;

  static final routes = [
    GetPage(
      transition:
          GetPlatform.isIOS ? Transition.cupertino : Transition.leftToRight,
      name: Routes.HOME,
      page: () => HomeView(),
      binding: InitialBindings(),
    ),
    GetPage(
        page: () => ChaptersView(),
        name: Routes.CHAPTERS,
        transition:
            GetPlatform.isIOS ? Transition.cupertino : Transition.leftToRight,
        binding: ChaptersBinding()),
    GetPage(
        name: Routes.WEBVIEW,
        page: () => WebViewPage(),
        transition:
            GetPlatform.isIOS ? Transition.cupertino : Transition.leftToRight)
  ];
}
