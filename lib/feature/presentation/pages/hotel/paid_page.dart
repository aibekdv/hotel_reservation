import 'package:flutter/material.dart';
import 'package:reservetion/config/config.dart';
import 'package:reservetion/feature/presentation/widgets/widgets.dart';

class PaidPage extends StatelessWidget {
  const PaidPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.white,
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
          "Бронирование",
          style: theme.textTheme.titleSmall,
        ),
        centerTitle: true,
        elevation: 0,
        bottomOpacity: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Container(
                  width: 94,
                  height: 94,
                  decoration: BoxDecoration(
                    color: AppColors.greyBg,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset("assets/images/success.png"),
                ),
                const SizedBox(height: 32),
                Text(
                  "Ваш заказ принят в работу",
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textGrey,
                    height: 1.20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Кнопка супер
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(
                top: BorderSide(color: AppColors.greyBg),
              ),
            ),
            child: CustomButtonWidget(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteConsts.hotelPage,
                    (route) => false,
                  );
                },
                title: "Супер!"),
          ),
        ],
      ),
    );
  }
}
