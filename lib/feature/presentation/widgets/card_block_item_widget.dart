import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reservation/config/config.dart';

class CardBlockItemWidget extends StatelessWidget {
  final String imgPath;
  final String title;
  final String desc;

  const CardBlockItemWidget({
    super.key,
    required this.imgPath,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imgPath, width: 24, height: 24),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1.2,
                            ),
                      ),
                      Text(
                        desc,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              height: 1.2,
                              color: AppColors.textGrey,
                            ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.navigate_next_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
