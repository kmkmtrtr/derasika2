// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:derasika2/data/model/play_mode.dart' as _i6;
import 'package:derasika2/ui/pages/home/home_page.dart' as _i1;
import 'package:derasika2/ui/pages/score_detail/score_detail_page.dart' as _i2;
import 'package:derasika2/ui/pages/webview/csv_import_webview.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.HomePage(key: args.key));
    },
    ScoreDetailRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<ScoreDetailRouteArgs>(
          orElse: () => ScoreDetailRouteArgs(chartId: pathParams.getInt('id')));
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.ScoreDetailPage(key: args.key, chartId: args.chartId),
          fullscreenDialog: true);
    },
    CsvImportWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CsvImportWebViewRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.CsvImportWebViewPage(
              key: args.key,
              playMode: args.playMode,
              versionId: args.versionId),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(ScoreDetailRoute.name, path: '/charts/:id'),
        _i4.RouteConfig(CsvImportWebViewRoute.name, path: '/csvImportWebView')
      ];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i5.Key? key})
      : super(name, path: '/', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i5.Key? key;
}

/// generated route for [_i2.ScoreDetailPage]
class ScoreDetailRoute extends _i4.PageRouteInfo<ScoreDetailRouteArgs> {
  ScoreDetailRoute({_i5.Key? key, required int chartId})
      : super(name,
            path: '/charts/:id',
            args: ScoreDetailRouteArgs(key: key, chartId: chartId),
            rawPathParams: {'id': chartId});

  static const String name = 'ScoreDetailRoute';
}

class ScoreDetailRouteArgs {
  const ScoreDetailRouteArgs({this.key, required this.chartId});

  final _i5.Key? key;

  final int chartId;
}

/// generated route for [_i3.CsvImportWebViewPage]
class CsvImportWebViewRoute
    extends _i4.PageRouteInfo<CsvImportWebViewRouteArgs> {
  CsvImportWebViewRoute(
      {_i5.Key? key, required _i6.PlayMode playMode, required int versionId})
      : super(name,
            path: '/csvImportWebView',
            args: CsvImportWebViewRouteArgs(
                key: key, playMode: playMode, versionId: versionId));

  static const String name = 'CsvImportWebViewRoute';
}

class CsvImportWebViewRouteArgs {
  const CsvImportWebViewRouteArgs(
      {this.key, required this.playMode, required this.versionId});

  final _i5.Key? key;

  final _i6.PlayMode playMode;

  final int versionId;
}
