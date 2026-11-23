import "package:flutter/material.dart";

import "package:gharsa/core/routing/routes.dart";
import "package:gharsa/core/widgets/unknown_route_screen.dart";

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Routes mapping will be attached as features are built
      case Routes.unknownRouteScreen:
      default:
        return MaterialPageRoute(builder: (_) => const UnknownRouteScreen());
    }
  }
}
