import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class ViewAnnouncementsPage extends StatelessWidget {

  final AnnouncementsModel announcements;
  const ViewAnnouncementsPage({
    required this.announcements,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.announcement,
          style: TextStyles.titleAppBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: Column(
                children: [

                  const SizedBox(height: 24,),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppImages.logo,
                      height: 72,
                    ),
                  ),

                  const SizedBox(height: 24,),

                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      Formatters().formatStringToDateTime(announcements.dataCadastro),
                      textAlign: TextAlign.center,
                      style: TextStyles.text,
                    ),
                  ),

                  const SizedBox(height: 8,),

                  Row(
                    children: [
                      Text(
                        tradutor.announcement.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyles.text,
                      ),

                      const Spacer(),

                      Text(
                        'N.° '+ announcements.id.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyles.text,
                      ),

                    ],
                  ),
                  const SizedBox(height: 1,),
                  Container(
                    color: AppColors.secundary,
                    height: 1.4,
                  ),

                  const SizedBox(height: 24,),
                  Text(
                    announcements.title,
                    textAlign: TextAlign.center,
                    style: TextStyles.titleAnnouncemnts,
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    announcements.subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyles.subTitleAnnouncemnts,
                  ),
                  const SizedBox(height: 32,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      announcements.mensagem,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: TextStyles.textCard,
                    ),
                  ),

                  const SizedBox(height: 24,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
