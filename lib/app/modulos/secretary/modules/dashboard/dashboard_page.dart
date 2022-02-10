import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class DashboardPage extends StatelessWidget {

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyles.titleAppBar,
        ),
      ),
      drawer: const CustomDrawerSecretary(),
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
                  children: const [

                    CardDashborad(
                      text: 'Alunos',
                      valor: '120',
                      color: AppColors.green,
                      icon: FontAwesomeIcons.graduationCap,
                    ),

                    CardDashborad(
                      text: 'Professores',
                      valor: '20',
                      color: AppColors.green,
                      icon: FontAwesomeIcons.chalkboardTeacher,
                    ),

                    CardDashborad(
                      text: 'Usuários',
                      valor: '110',
                      color: AppColors.green,
                      icon: FontAwesomeIcons.users,
                    ),

                    CardDashborad(
                      text: 'Pastores',
                      valor: '17',
                      color: AppColors.orange,
                      icon: FontAwesomeIcons.blackTie,
                    ),

                    CardDashborad(
                      text: 'Igrejas',
                      valor: '15',
                      color: AppColors.orange,
                      icon: FontAwesomeIcons.placeOfWorship,
                    ),

                    CardDashborad(
                      text: 'Turmas',
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
    );

  }
}
