import 'package:flutter/material.dart';

import '../../../../secretary.dart';
import '../../../../../../shared/shared.dart';

class CardAnnouncements extends StatelessWidget {

  final AnnouncementsModel announcementsModel;
  final GestureTapCallback? onTap;

  const CardAnnouncements({
    required this.announcementsModel,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          elevation: 3,
          child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    announcementsModel.title,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.titleCardLight,
                  ),

                  const SizedBox(height: 8,),

                  Text(
                    announcementsModel.subTitle,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.textCard,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
