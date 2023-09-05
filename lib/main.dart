import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/config/routes/on_generate_route.dart';
import 'package:reservation/feature/presentation/cubit/hotel_cubit.dart';
import 'injection_container.dart' as di;
import 'config/config.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<HotelCubit>(),
      child: MaterialApp(
        title: 'Reservation hotel',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: RouteConsts.hotelPage,
        onGenerateRoute: OnGenerateRoute.route,
      ),
    );
  }
}
