import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../modulos.dart';

class SecretaryPage extends StatefulWidget {

  final String? name;
  const SecretaryPage({Key? key, this.name,}) : super(key: key);

  @override
  State<SecretaryPage> createState() => _SecretaryPageState();
}

class _SecretaryPageState extends State<SecretaryPage> {

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.name!=null){
      getRotas(widget.name!);
    }

    return Provider(
      create: (_) => SecretaryController(pageController),

      child: Consumer<SecretaryController>(
          builder: (context, controller, child){
            if(widget.name!=null){
              controller.page = getRotas(widget.name!);
              controller.setPage(getRotas(widget.name!));
            }
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              HomeSecretaryPage(),
              DashboardPage(),
              AnnouncementsPage(),
              StudentsPage(),
              TeachersPage(),
              PastorPage(),
              ChurchPage(),
              CoursePage(),
              SizedBox(),
            ],
          );
        }
      ),
    );
  }

  EnumsSecretary getRotas(String name){
    switch (name) {
      case 'dashboard':
        return EnumsSecretary.dashboard;
      case 'announcements':
        return EnumsSecretary.comunicados;
      case 'students':
        return EnumsSecretary.alunos;
      case 'teachers':
        return EnumsSecretary.professores;
      case 'pastor':
        return EnumsSecretary.pastores;
      case 'church':
        return EnumsSecretary.igrejas;
      case 'courses':
        return EnumsSecretary.turmas;
      default:
        return EnumsSecretary.home;
    }
  }

}
