import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class DashboardPage extends StatefulWidget {

  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Row(
      children: [
        if(!sizeConfig.isMobile())
          const CustomDrawerSecretary(),
        Expanded(
          child: Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              title: Text(
                tradutor!.dashboard,
                style: TextStyles.titleAppBar,
              ),
            ),
            drawer: sizeConfig.isMobile()? const CustomDrawerSecretary():null,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        alignment: WrapAlignment.end,
                        spacing: 8,
                        runSpacing: 16,
                        children: [

                          CardDashborad(
                            text: tradutor.students,
                            valor: '120',
                            color: AppColors.green,
                            icon: FontAwesomeIcons.graduationCap,
                          ),

                          CardDashborad(
                            text: tradutor.teachers,
                            valor: '20',
                            color: AppColors.green,
                            icon: FontAwesomeIcons.chalkboardTeacher,
                          ),

                          CardDashborad(
                            text: tradutor.users,
                            valor: '110',
                            color: AppColors.green,
                            icon: FontAwesomeIcons.users,
                          ),

                          CardDashborad(
                            text: tradutor.pastors,
                            valor: '17',
                            color: AppColors.orange,
                            icon: FontAwesomeIcons.blackTie,
                          ),

                          CardDashborad(
                            text: tradutor.churches,
                            valor: '15',
                            color: AppColors.orange,
                            icon: FontAwesomeIcons.placeOfWorship,
                          ),

                          CardDashborad(
                            text:  tradutor.classes,
                            valor: '20',
                            color: AppColors.orange,
                            icon: FontAwesomeIcons.guitar,
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

  }
}
