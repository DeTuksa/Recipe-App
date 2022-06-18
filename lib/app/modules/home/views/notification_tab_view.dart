import 'package:daisy_recipe/app/modules/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationTabView extends StatefulWidget {
  const NotificationTabView({Key? key}) : super(key: key);

  @override
  State<NotificationTabView> createState() => _NotificationTabViewState();
}

class _NotificationTabViewState extends State<NotificationTabView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: Text(
              'Notifications',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const NotificationCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
