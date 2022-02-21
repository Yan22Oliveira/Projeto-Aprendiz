import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../secretary.dart';

class CustomDrawerSecretary extends StatefulWidget {

  const CustomDrawerSecretary({Key? key}) : super(key: key);

  @override
  State<CustomDrawerSecretary> createState() => _CustomDrawerSecretaryState();
}

class _CustomDrawerSecretaryState extends State<CustomDrawerSecretary> {

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Drawer(
      elevation: 1,
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.white70,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const CustomDrawerHeaderSecretary(),
                    DrawerTileSecretary(
                      iconData: FontAwesomeIcons.home,
                      title: tradutor!.start,
                      page: EnumsSecretary.home,
                    ),
                    DrawerTileSecretary(
                      iconData: FontAwesomeIcons.chartLine,
                      title: tradutor.dashboard,
                      page: EnumsSecretary.dashboard,
                    ),
                    DrawerTileSecretary(
                      iconData: FontAwesomeIcons.scroll,
                      title: tradutor.announcements,
                      page: EnumsSecretary.comunicados,
                    ),

                    const Divider(),

                    DrawerTileSecretary(
                      iconData: FontAwesomeIcons.graduationCap,
                      title: tradutor.students,
                      page: EnumsSecretary.alunos,
                    ),

                    DrawerTileSecretary(
                      iconData: FontAwesomeIcons.chalkboardTeacher,
                      title: tradutor.teachers,
                      page: EnumsSecretary.professores,
                    ),

                    const Divider(),

                    DrawerTileSecretary(
                      iconData: FontAwesomeIcons.blackTie,
                      title: tradutor.pastors,
                      page: EnumsSecretary.pastores,
                    ),

                    DrawerTileSecretary(
                      iconData: FontAwesomeIcons.placeOfWorship,
                      title: tradutor.churches,
                      page: EnumsSecretary.igrejas,
                    ),

                    DrawerTileSecretary(
                      iconData: FontAwesomeIcons.guitar,
                      title: tradutor.courses,
                      page: EnumsSecretary.turmas,
                    ),

                    const Divider(),

                    DrawerTileSecretary(
                      iconData: FontAwesomeIcons.userCog,
                      title: tradutor.changeModule,
                      page: EnumsSecretary.trocarModulo,
                    ),

                    DrawerTileSecretary(
                      iconData: FontAwesomeIcons.signOutAlt,
                      title: tradutor.logOut,
                      page: EnumsSecretary.sair,
                    ),

                    const Divider(),

                  ],
                ),
              ),
              Container(
                width: 1,
                color: Colors.grey.shade300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}