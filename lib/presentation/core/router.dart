import 'package:auto_route/auto_route.dart';
import 'package:time_architect/presentation/pages/blueprint_form_page.dart';
import 'package:time_architect/presentation/pages/blueprint_list_page.dart';

const String PageSuffix = 'Page';
const String RouteSuffix = 'Route';

@MaterialAutoRouter(
    replaceInRouteName: '$PageSuffix,$RouteSuffix',
    routes: <AutoRoute<dynamic>>[
      AutoRoute(
        initial: true,
        page: BlueprintListPage,
      ),
      AutoRoute(
        page: BlueprintFormPage,
      ),
    ])
class $AppRouter {}
