import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import '../../../../shared/shared.dart';

import '../../secretary.dart';

class DrawerTileSecretary extends StatelessWidget {

  const DrawerTileSecretary({
    Key? key,
    required this.iconData,
    required this.title,
    required this.page,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final EnumsSecretary page;

  @override
  Widget build(BuildContext context) {

    final EnumsSecretary curPage = context.watch<SecretaryController>().page;

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: (){

          //Trocar de Módulo
          if(page==EnumsSecretary.trocarModulo){
            Modular.to.navigate('/home/');
          }

          context.read<SecretaryController>().setPage(page);
        },
        child: SizedBox(
          height: 60,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Icon(
                  iconData,
                  size: 28,
                  color: curPage == page ? AppColors.primary : Colors.grey[700],
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: curPage == page ? AppColors.primary : Colors.grey[700],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
