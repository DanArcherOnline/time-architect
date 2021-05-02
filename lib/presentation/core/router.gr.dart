// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/blueprint_form_page.dart' as _i4;
import '../pages/blueprint_list_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    BlueprintListRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.BlueprintListPage());
    },
    BlueprintFormRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.BlueprintFormPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(BlueprintListRoute.name, path: '/'),
        _i1.RouteConfig(BlueprintFormRoute.name, path: '/blueprint-form-page')
      ];
}

class BlueprintListRoute extends _i1.PageRouteInfo {
  const BlueprintListRoute() : super(name, path: '/');

  static const String name = 'BlueprintListRoute';
}

class BlueprintFormRoute extends _i1.PageRouteInfo {
  const BlueprintFormRoute() : super(name, path: '/blueprint-form-page');

  static const String name = 'BlueprintFormRoute';
}
