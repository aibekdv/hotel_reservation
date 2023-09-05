import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/config/config.dart';
import 'package:reservation/config/routes/on_generate_route.dart';
import 'package:reservation/feature/data/models/hotel_model.dart';
import 'package:reservation/feature/presentation/cubit/hotel_cubit.dart';
import 'package:reservation/feature/presentation/widgets/widgets.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  HotelModel? hotel;

  @override
  void initState() {
    super.initState();
    context.read<HotelCubit>().getHotel();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.greyBg,
      appBar: AppBar(
        title: Text("Отель", style: theme.textTheme.titleSmall),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        bottomOpacity: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
      ),
      body: BlocBuilder<HotelCubit, HotelState>(
        builder: (context, state) {
          if (state is HotelLoading) {
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
          } else if (state is HotelLoaded) {
            hotel = state.hotel;
          } else if (state is HotelError) {
            return const Center(
              child: Text("Ошибка"),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Карусель из фотографий
                Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CarouselWidget(urls: hotel!.imageUrls!),
                ),
                // Основные данные про отель
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Container(
                        width: 149,
                        height: 29,
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.yellowDeep,
                              size: 20,
                            ),
                            Text(
                              '${hotel!.rating} ${hotel!.ratingName}',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.yellowDeep,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${hotel!.name}",
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${hotel!.adress}",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "от ${hotel!.minimalPrice} ₽ ",
                              style: theme.textTheme.titleLarge,
                            ),
                            TextSpan(
                              text: "за тур с перелётом",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Подробные данные об отеле
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Об отеле", style: theme.textTheme.titleMedium),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          ...hotel!.aboutTheHotel!.peculiarities!.map(
                            (item) => CardTextWidget(title: item),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "${hotel!.aboutTheHotel!.description}",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.20,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppColors.greyBg,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const CardBlockItemWidget(
                              imgPath: "assets/images/emoji-happy.png",
                              title: "Удобства",
                              desc: "Самое необходимое",
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(36, 5, 0, 5),
                              child: Divider(
                                color: AppColors.textGrey.withOpacity(.20),
                              ),
                            ),
                            const CardBlockItemWidget(
                              imgPath: "assets/images/tick-square.png",
                              title: "Что включено",
                              desc: "Самое необходимое",
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(36, 5, 0, 5),
                              child: Divider(
                                color: AppColors.textGrey.withOpacity(.20),
                              ),
                            ),
                            const CardBlockItemWidget(
                              imgPath: "assets/images/close-square.png",
                              title: "Что не включено",
                              desc: "Самое необходимое",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Кнопка выбора номера
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: CustomButtonWidget(
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteConsts.roomsPage,
                      arguments: ScreenRouteArgs(roomsTitle: hotel!.name),
                    ),
                    title: "К выбору номера",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
