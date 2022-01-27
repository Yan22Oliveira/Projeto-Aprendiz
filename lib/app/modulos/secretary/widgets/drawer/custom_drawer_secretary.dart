import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../secretary.dart';

class CustomDrawerSecretary extends StatelessWidget {

  const CustomDrawerSecretary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          ListView(
            children: const <Widget>[
              CustomDrawerHeaderSecretary(),
              DrawerTileSecretary(
                iconData: FontAwesomeIcons.home,
                title: 'Início',
                page: EnumsSecretary.home,
              ),
              DrawerTileSecretary(
                iconData: FontAwesomeIcons.chartLine,
                title: 'Dashboard',
                page: EnumsSecretary.dashboard,
              ),
              DrawerTileSecretary(
                iconData: FontAwesomeIcons.scroll,
                title: 'Comunicados',
                page: EnumsSecretary.comunicados,
              ),
              Divider(),

              DrawerTileSecretary(
                iconData: FontAwesomeIcons.blackTie,
                title: 'Pastores',
                page: EnumsSecretary.pastores,
              ),

              DrawerTileSecretary(
                iconData: FontAwesomeIcons.placeOfWorship,
                title: 'Igrejas',
                page: EnumsSecretary.igrejas,
              ),

              DrawerTileSecretary(
                iconData: FontAwesomeIcons.guitar,
                title: 'Turmas',
                page: EnumsSecretary.turmas,
              ),

              Divider(),

              DrawerTileSecretary(
                iconData: FontAwesomeIcons.userCog,
                title: 'Trocar Módulo',
                page: EnumsSecretary.trocarModulo,
              ),

              DrawerTileSecretary(
                iconData: FontAwesomeIcons.signOutAlt,
                title: 'Sair',
                page: EnumsSecretary.sair,
              ),

              Divider(),

            ],
          ),
        ],
      ),
    );
  }
}