import 'package:flutter/material.dart';

import '../../shared.dart';

class ErroPage extends StatelessWidget {

  final String text;
  const ErroPage({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Container(
      height: sizeConfig.height(),
      color: AppColors.background,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Image.asset(
                AppImages.erro,
                fit: BoxFit.fitWidth,
                height: sizeConfig.height()*0.5,
              ),
              Text(
                text,
                style: TextStyles.titleCard,
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
