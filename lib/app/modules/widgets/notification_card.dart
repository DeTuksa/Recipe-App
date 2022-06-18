import 'package:daisy_recipe/app/data/constants/app_theme.dart';
import 'package:daisy_recipe/app/data/constants/spacers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppTheme.notificationBackground
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
               padding: const EdgeInsets.all(8),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12),
                 color: AppTheme.iconBackground
               ),
               child: const Center(
                 child: Icon(
                  CupertinoIcons.doc_text_fill,
                   color: AppTheme.notificationIcon,
                   size: 14,
                 ),
               ),
             ),
            AppSpacer.W10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'New recipe!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                  ),
                ),
                AppSpacer.H5,
                SizedBox(
                  width: Get.width * 0.65,
                  child: const Text(
                    'Far away, behind the word mountains far from the countries.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.notificationText
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
