import 'package:flutter/material.dart';

import '../../shared.dart';

class CardModulo extends StatelessWidget {

  final String title;
  final String text;
  final IconData icon;
  final bool aguardandoLiberacao;
  final GestureTapCallback? onTap;

  const CardModulo({
    required this.title,
    required this.text,
    required this.icon,
    this.aguardandoLiberacao = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Card(
            color: aguardandoLiberacao
                ?AppColors.greyLight
                :AppColors.background,
            elevation: aguardandoLiberacao?0:3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: aguardandoLiberacao
                          ?AppColors.grey
                          :AppColors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      color: AppColors.background,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyles.titleCard,
                        ),
                        const SizedBox(height: 8,),
                        Text(
                          text,
                          style: TextStyles.textCard,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8,),
      ],
    );
  }
}
