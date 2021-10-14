import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/shared.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Inicial',
          style: TextStyles.titleAppBar,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              CardModulo(
                title: 'Aluno',
                text: 'Módulo de acesso do aluno',
                icon: FontAwesomeIcons.graduationCap,
              ),

              if(2==2)
              CardModulo(
                title: 'Professor',
                text: 'Módulo de acesso do professor',
                icon: FontAwesomeIcons.chalkboardTeacher,
                aguardandoLiberacao: false,
              ),

              if(1==2)
              CardModulo(
                title: 'Professor',
                text: 'Agurdando liberação',
                icon: FontAwesomeIcons.chalkboardTeacher,
                aguardandoLiberacao: true,
              ),

              if(2==2)
              CardModulo(
                title: 'Secretário',
                text: 'Sistema de gestão do Projeto Aprendiz, relatórios, liberação, etc ...',
                icon: Icons.dashboard,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: (2==1)?null:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child:
            ButtonPrincipal(
              text: 'Cadastrar como professor',
              onPressed: (){

              },
            ),
          ),
          const SizedBox(height: 56,),
        ],
      ),

    );
  }
}
