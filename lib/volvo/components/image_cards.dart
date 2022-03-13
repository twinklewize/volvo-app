import 'package:flutter/material.dart';
import 'package:volvo_app/feedback_form/feedback_form_view.dart';
import 'package:volvo_app/notifications/notification_service.dart';

class ImageCards extends StatefulWidget {
  @override
  State<ImageCards> createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {
  late Function(String?) onClickedNotification;
  @override
  void initState() {
    super.initState();
    onClickedNotification = (String? payload) => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FeedbackFormView(),
          ),
        );
    NotificationService.init();
    listenNotifications();
  }

  @override
  void dispose() {
    onClickedNotification = (String? payload) {};

    super.dispose();
  }

  void listenNotifications() =>
      NotificationService.onNotifications.stream.listen(onClickedNotification);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            ImageCard(
              image: 'assets/images/image_card_1.png',
              press: () {
                NotificationService.showNotification(
                  title: 'Вы недавно посещали наш сервисный центр',
                  body: 'Оцените обслуживание',
                );
              },
            ),
            const SizedBox(width: 8),
            ImageCard(
              image: 'assets/images/image_card_2.png',
              press: () {
                NotificationService.showSheduledNotification(
                  title: 'Вы недавно посещали наш сервисный центр',
                  body: 'Оцените обслуживание',
                  scheduledDate: DateTime.now().add(Duration(seconds: 12)),
                );
              },
            ),
            const SizedBox(width: 8),
            ImageCard(
              image: 'assets/images/image_card_3.png',
              press: () {},
            ),
            const SizedBox(width: 8),
            ImageCard(
              image: 'assets/images/image_card_4.png',
              press: () {},
            ),
            const SizedBox(width: 8),
            ImageCard(
              image: 'assets/images/image_card_5.png',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors

  final String image;
  final Function() press;

  // ignore: use_key_in_widget_constructors
  const ImageCard({
    required this.image,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(image),
      ),
    );
  }
}
