import 'package:flutter/material.dart';

import '../../../../../../shared/shared.dart';

class CardChurch extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color color;
  final GestureTapCallback? onTap;

  const CardChurch({
    required this.text,
    required this.icon,
    required this.color,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    double widthCard = (sizeConfig.width()>390)?330:double.infinity;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        elevation: 3,
        child: Container(
          height: 120,
          width: widthCard,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyles.textDashBoard,
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                icon,
                color: AppColors.background,
                size: 80,
              ),
              const SizedBox(width: 24,),
            ],
          ),
        ),
      ),
    );

  }
}