import 'package:flutter/material.dart';
import 'package:reservation/config/config.dart';
import 'package:reservation/feature/presentation/pages/pages.dart';

final class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments as ScreenRouteArgs?;

    switch (settings.name) {
      // Hotel page route
      case RouteConsts.hotelPage:
        return routeBuilder(const HotelPage());
      // Rooms page route
      case RouteConsts.roomsPage:
        return routeBuilder(HotelNumbersPage(
          title: args!.roomsTitle!,
        ));
      // Reservation page route
      case RouteConsts.reservationPage:
        return routeBuilder(const ReservationPage());
      // Paid page route
      case RouteConsts.paidPage:
        return routeBuilder(const PaidPage());
      // Error page route
      default:
        return routeBuilder(const ErrorPage());
    }
  }
}

class ScreenRouteArgs {
  final String? roomsTitle;

  ScreenRouteArgs({this.roomsTitle});
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Error"),
      ),
    );
  }
}

MaterialPageRoute routeBuilder(Widget widget) {
  return MaterialPageRoute(
    builder: (context) => widget,
  );
}
