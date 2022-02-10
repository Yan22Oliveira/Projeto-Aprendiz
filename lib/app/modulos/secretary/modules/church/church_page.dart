import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class ChurchPage extends StatelessWidget {

  const ChurchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.churches,
          style: TextStyles.titleAppBar,
        ),
      ),
      drawer: const CustomDrawerSecretary(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            alignment: Alignment.topCenter,
            color: AppColors.background,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: Column(
                children: [

                  CardChurch(
                    text: tradutor.churches,
                    color: AppColors.green,
                    icon: FontAwesomeIcons.placeOfWorship,
                    onTap: (){
                      Modular.to.pushNamed('/secretary/church/list_churches/');
                    },
                  ),

                  const SizedBox(height: 16,),

                  CardChurch(
                    text: tradutor.areas,
                    color: AppColors.green,
                    icon: FontAwesomeIcons.sitemap,
                    onTap: (){
                      Modular.to.pushNamed('/secretary/church/areas/');
                    },
                  ),

                  const SizedBox(height: 16,),

                  CardChurch(
                    text: tradutor.regions,
                    color: AppColors.green,
                    icon: FontAwesomeIcons.globe,
                    onTap: (){
                      Modular.to.pushNamed('/secretary/church/regions/');
                    },
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
