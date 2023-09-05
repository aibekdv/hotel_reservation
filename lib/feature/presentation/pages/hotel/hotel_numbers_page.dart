import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/config/config.dart';
import 'package:reservation/config/routes/on_generate_route.dart';
import 'package:reservation/feature/data/models/models.dart';
import 'package:reservation/feature/presentation/cubit/hotel_cubit.dart';
import 'package:reservation/feature/presentation/widgets/widgets.dart';

class HotelNumbersPage extends StatefulWidget {
  final String title;

  const HotelNumbersPage({
    super.key,
    required this.title,
  });

  @override
  State<HotelNumbersPage> createState() => _HotelNumbersPageState();
}

class _HotelNumbersPageState extends State<HotelNumbersPage> {
  List<RoomModel> rooms = [];

  @override
  void initState() {
    super.initState();
    context.read<HotelCubit>().getRooms();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.greyBg,
      // Навигационная панель
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.title,
          style: theme.textTheme.titleSmall,
        ),
        centerTitle: true,
        elevation: 0,
        bottomOpacity: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
      ),
      body: BlocBuilder<HotelCubit, HotelState>(
        builder: (context, state) {
          if (state is RoomsLoading) {
            return Center(
              child: Container(
                width: 65,
                height: 65,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const CircularProgressIndicator(
                  color: AppColors.blue,
                ),
              ),
            );
          } else if (state is RoomsLoaded) {
            rooms = state.rooms;
          } else if (state is RoomsError) {
            return const Center(
              child: Text("Ошибка"),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Блок с номером
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index) => HotelCardItemWidget(
                    room: rooms[index],
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteConsts.reservationPage,
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemCount: rooms.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
