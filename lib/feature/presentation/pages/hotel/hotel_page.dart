import 'package:flutter/material.dart';
import 'package:reservetion/config/config.dart';
import 'package:reservetion/feature/presentation/widgets/widgets.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  static List<String> images = [
    'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=',
    'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.greyBg,
      appBar: AppBar(
        title: Text("Отель", style: theme.textTheme.titleSmall),
        centerTitle: true,
        elevation: 0,
        bottomOpacity: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Carousel
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: CarouselWidget(urls: images),
            ),
            //
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
                          '5 Превосходно',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.yellowDeep,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Steigenberger Makadi",
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "от 134 673 ₽ ",
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
                  const Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      CardTextWidget(title: "3-я линия"),
                      CardTextWidget(title: "Платный Wi-Fi в фойе"),
                      CardTextWidget(title: "30 км до аэропорта"),
                      CardTextWidget(title: "1 км до пляжа"),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
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
              child: CustomButtonWidget(onTap: () {}, title: "К выбору номера"),
            )
          ],
        ),
      ),
    );
  }
}
