import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../secretary.dart';
import '../../../../../../shared/shared.dart';

class CardHome extends StatelessWidget {

  final InformacaoModel informacao;
  const CardHome({
    required this.informacao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    double widthCard = (sizeConfig.width()>390)?330:double.infinity;

    if(informacao.ativo!){
      return Card(
        color: Colors.white,
        elevation: 3,
        child: Container(
          width: widthCard,
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      informacao.texto!,
                      textAlign: TextAlign.start,
                      style: TextStyles.titleCardLight,
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      informacao.subTexto!,
                      textAlign: TextAlign.start,
                      style: TextStyles.textCard,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8,),
              Icon(
                informacao.status!? FontAwesomeIcons.calendarCheck:FontAwesomeIcons.calendarAlt,
                color: informacao.status!? AppColors.green: AppColors.primary,
                size: 60,
              ),
            ],
          ),
        ),
      );
    }else{
      return const SizedBox();
    }

  }
}
