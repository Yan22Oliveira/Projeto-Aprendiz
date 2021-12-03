import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class StudentPage extends StatelessWidget {

  const StudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Módulo do Aluno',
          style: TextStyles.titleAppBar,
        ),
        elevation: 0,
      ),
    );
  }

}
