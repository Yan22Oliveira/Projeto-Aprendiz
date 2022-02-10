import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class CustomDrawerHeaderSecretary extends StatelessWidget {

  const CustomDrawerHeaderSecretary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColors.background,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(
            color: AppColors.background,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4),
            child: Center(
              child: Image.asset(
                AppImages.logo,
                height: 170,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, url, error) => const SizedBox(
                  child: Icon(
                    Icons.error,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),

          const Divider(),

        ],
      ),
    );

  }
}