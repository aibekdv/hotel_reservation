import 'package:flutter/material.dart';
import 'package:reservetion/config/config.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        minimumSize: const Size.fromHeight(48),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
