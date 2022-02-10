import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../modulos.dart';

class SecretaryPage extends StatelessWidget {

  SecretaryPage({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => SecretaryController(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          HomeSecretaryPage(),
          DashboardPage(),
          AnnouncementsPage(),
          PastorPage(),
          ChurchPage(),
        ],
      ),
    );
  }

}
