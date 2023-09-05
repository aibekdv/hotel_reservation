import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reservation/config/config.dart';
import 'package:reservation/feature/data/models/models.dart';
import 'package:reservation/feature/domain/entities/entities.dart';
import 'package:reservation/feature/presentation/cubit/hotel_cubit.dart';
import 'package:reservation/feature/presentation/widgets/widgets.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  ReservationModel? reservation;
  bool isLoading = false;
  final List<TouristEntity> tourists = [
    TouristEntity(
      firstName: TextEditingController(),
      lastName: TextEditingController(),
      birthDay: TextEditingController(),
      citizenship: TextEditingController(),
      passportNumber: TextEditingController(),
      passportValidityPeriod: TextEditingController(),
    ),
  ];

  @override
  void dispose() {
    // Освобождаем ресурсы, связанные с контроллерами
    emailController.dispose();
    phoneController.dispose();
    phoneMaskFormatter.clear();
    for (var tourist in tourists) {
      tourist.firstName.dispose();
      tourist.lastName.dispose();
      tourist.birthDay.dispose();
      tourist.citizenship.dispose();
      tourist.passportNumber.dispose();
      tourist.passportValidityPeriod.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<HotelCubit>().getReservation();
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
          "Бронирование",
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
          if (state is ReservationLoading) {
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
          } else if (state is ReservationLoaded) {
            reservation = state.reservation;
          } else if (state is ReservationError) {
            return const Center(
              child: Text("Ошибка"),
            );
          }

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  //  Блок с отелем
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                                '${reservation!.horating} ${reservation!.ratingName}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.yellowDeep,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${reservation!.hotelName}",
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${reservation!.hotelAdress}",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  //  Блок с данными брони
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: FixedColumnWidth(140),
                        1: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.top,
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Вылет из',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textGrey,
                                  height: 1.20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '${reservation!.departure}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  height: 1.20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Страна, город',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textGrey,
                                  height: 1.20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '${reservation!.arrivalCountry}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  height: 1.20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Даты',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textGrey,
                                  height: 1.20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '${reservation!.tourDateStart} – ${reservation!.tourDateStop}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  height: 1.20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Кол-во ночей',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textGrey,
                                  height: 1.20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '${reservation!.numberOfNights}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  height: 1.20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Отель',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textGrey,
                                  height: 1.20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '${reservation!.hotelName}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  height: 1.20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Номер',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textGrey,
                                  height: 1.20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '${reservation!.room}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  height: 1.20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Питание',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textGrey,
                                  height: 1.20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '${reservation!.nutrition}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  height: 1.20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Блок с информацией о покупателе
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Информация о покупателе",
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 20),
                        CustomInputWidget(
                          label: "Номер телефона",
                          keyboardType: TextInputType.phone,
                          inputFormatters: [phoneMaskFormatter],
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Введите номер телефона";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        CustomInputWidget(
                          label: "Почта",
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Введите почта";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                          style: TextStyle(
                            color: Color(0xFF828796),
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  //  Блок с информацией о туристах
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < tourists.length; i++)
                        Column(
                          children: [
                            TouristCardItemWidget(
                              touristEntity: tourists[i],
                              title: parseNumberToString(i + 1),
                            ),
                            if (i + 1 < tourists.length)
                              const SizedBox(height: 8),
                          ],
                        ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  // Кнопка Добавить туриста
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tourists.add(
                          TouristEntity(
                            firstName: TextEditingController(),
                            lastName: TextEditingController(),
                            birthDay: TextEditingController(),
                            citizenship: TextEditingController(),
                            passportNumber: TextEditingController(),
                            passportValidityPeriod: TextEditingController(),
                          ),
                        );
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Добавить туриста",
                            style: theme.textTheme.titleMedium?.copyWith(
                              height: 1.20,
                            ),
                          ),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 24,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  //  Блок с итоговой ценой
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Тур",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.textGrey,
                                height: 1.20,
                              ),
                            ),
                            Text(
                              "${reservation!.tourPrice} ₽",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Топливный сбор",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.textGrey,
                                height: 1.20,
                              ),
                            ),
                            Text(
                              "${reservation!.fuelCharge} ₽",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Сервисный сбор",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.textGrey,
                                height: 1.20,
                              ),
                            ),
                            Text(
                              "${reservation!.serviceCharge} ₽",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "К оплате",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.textGrey,
                                height: 1.20,
                              ),
                            ),
                            Text(
                              "${(reservation!.tourPrice! + reservation!.fuelCharge! + reservation!.serviceCharge!)} ₽",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.20,
                                color: AppColors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Кнопка оплатить
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
                      onTap: _submitForm,
                      isLoading: isLoading,
                      title:
                          "Оплатить ${(reservation!.tourPrice! + reservation!.fuelCharge! + reservation!.serviceCharge!)} ₽",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _submitForm() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 800));

    if (_formKey.currentState!.validate()) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, RouteConsts.paidPage);
      isLoading = false;
      setState(() {});
      /*
      log("""
          Phone number: ${phoneController.text}
          Email address: ${emailController.text}
      """);

      for (var i = 0; i < tourists.length; i++) {
        log("""
          First name: ${tourists[i].firstName.text}
          Last name: ${tourists[i].lastName.text}
          Birthday: ${tourists[i].birthDay.text}
          Passport number: ${tourists[i].passportNumber.text}
          Passport validityPeriod: ${tourists[i].passportValidityPeriod.text}
          Citizenship: ${tourists[i].citizenship.text}
        """);
      }
      */
    } else {
      isLoading = false;
      setState(() {});
    }
  }
}
