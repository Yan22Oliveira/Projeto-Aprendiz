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
            child: Center(
              child: Image.asset(
                AppImages.logoDiv,
                height: 180,
                fit: BoxFit.scaleDown,
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