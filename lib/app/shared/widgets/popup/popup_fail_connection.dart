import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared.dart';

class PopupFailConnection extends StatefulWidget {

  final VoidCallback? onPressed;
  const PopupFailConnection({
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<PopupFailConnection> createState() => _PopupFailConnectionState();
}

class _PopupFailConnectionState extends State<PopupFailConnection> {

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      backgroundColor: AppColors.background,
      child: SizedBox(
        width: 270,
        height: 298,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(
                Icons.wifi_off_sharp,
                color: AppColors.secundary,
                size: 70,
              ),
              const SizedBox(height: 25,),
              Text(
                tradutor!.couldNotConnect,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7,),
              Text(
                tradutor.checkYourInternetConnection,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 150,
                child: ButtonSimples(
                  text: 'OK',
                  color: AppColors.primary,
                  onPressed: widget.onPressed,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
