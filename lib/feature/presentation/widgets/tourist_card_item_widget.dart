import 'package:flutter/material.dart';
import 'package:reservetion/config/config.dart';
import 'package:reservetion/feature/domain/entities/tourist_entity.dart';
import 'package:reservetion/feature/presentation/widgets/widgets.dart';

class TouristCardItemWidget extends StatefulWidget {
  final TouristEntity touristEntity;
  final String title;

  const TouristCardItemWidget({
    super.key,
    required this.touristEntity,
    required this.title,
  });

  @override
  State<TouristCardItemWidget> createState() => _TouristCardItemWidgetState();
}

class _TouristCardItemWidgetState extends State<TouristCardItemWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.bounceIn,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        height: 1.20,
                      ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0x190D72FF),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppColors.blue,
                    size: 32,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: isExpanded ? null : 0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  CustomInputWidget(
                    label: "Имя",
                    controller: widget.touristEntity.firstName,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Введите имя";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomInputWidget(
                    label: "Фамилия",
                    controller: widget.touristEntity.lastName,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Введите фамилия";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomInputWidget(
                    label: "Дата рождения",
                    controller: widget.touristEntity.birthDay,
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Введите день рождения";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomInputWidget(
                    label: "Гражданство",
                    controller: widget.touristEntity.citizenship,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Введите гражданство";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomInputWidget(
                    label: "Номер загранпаспорта",
                    controller: widget.touristEntity.passportNumber,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Введите номер загранпаспорта";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomInputWidget(
                    label: "Срок действия загранпаспорта",
                    controller: widget.touristEntity.passportValidityPeriod,
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Введите срок действия загранпаспорта";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
