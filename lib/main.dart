import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservetion/feature/presentation/cubit/hotel_cubit.dart';
import 'feature/presentation/pages/pages.dart';
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
    return MaterialApp(
      title: 'Reservetion hotel',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: BlocProvider(
        create: (context) => di.sl<HotelCubit>(),
        child: const HotelPage(),
      ),
    );
  }
}
