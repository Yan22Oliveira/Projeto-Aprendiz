import 'package:flutter/material.dart';

import '../../../../../../shared/shared.dart';

class CardDashborad extends StatelessWidget {

  final String text;
  final String valor;
  final IconData icon;
  final Color color;

  const CardDashborad({
    required this.text,
    required this.valor,
    required this.icon,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    double widthCard = (sizeConfig.width()>390)?330:double.infinity;

    return Card(
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
                const SizedBox(height: 8,),
                Text(
                  valor,
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
    );

  }
}
