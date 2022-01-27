import 'package:flutter/material.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class HomeSecretaryPage extends StatelessWidget {

  const HomeSecretaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Secretário',
          style: TextStyles.titleAppBar,
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.background,
        ),
      ),
      drawer: const CustomDrawerSecretary(),
      body: Container(),
    );
  }

}
