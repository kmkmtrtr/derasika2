// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:derasika2/ui/pages/home/home_page.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.HomePage(key: args.key));
    }
  };

  @override
  List<_i2.RouteConfig> get routes =>
      [_i2.RouteConfig(HomeRoute.name, path: '/')];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i3.Key? key})
      : super(name, path: '/', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i3.Key? key;
}
