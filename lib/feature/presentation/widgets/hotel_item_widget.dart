import 'package:flutter/material.dart';
import 'package:reservation/config/config.dart';
import 'package:reservation/feature/data/models/room_model.dart';

import 'widgets.dart';

class HotelCardItemWidget extends StatelessWidget {
  final RoomModel room;
  final VoidCallback onTap;

  const HotelCardItemWidget({
    super.key,
    required this.room,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: AppColors.white,
            child: CarouselWidget(
              urls: room.imageUrls ?? [""],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            room.name.toString(),
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              ...room.peculiarities!.map(
                (item) => CardTextWidget(title: item),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 192,
              padding: const EdgeInsets.fromLTRB(10, 5, 2, 5),
              decoration: BoxDecoration(
                color: const Color(0x190D72FF),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Text(
                    "Подробнее о номере",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.blue,
                      height: 1.20,
                    ),
                  ),
                  const Icon(
                    Icons.navigate_next,
                    color: AppColors.blue,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "от ${room.price} ₽ ",
                  style: theme.textTheme.titleLarge,
                ),
                TextSpan(
                  text: "${room.pricePer}",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CustomButtonWidget(onTap: onTap, title: "Выбрать номер"),
        ],
      ),
    );
  }
}
