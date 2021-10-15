import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared.dart';

class TimeLine extends StatelessWidget {

  final Color colors;
  final bool? firstConfirmed;
  final bool? secondConfirmed;

  const TimeLine({
    required this.colors,
    this.firstConfirmed  = false,
    this.secondConfirmed = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                color: colors,
                height: 40,
                width: 40,
                child: Center(
                  child: !firstConfirmed! ?
                  const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ):
                  const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                color: !firstConfirmed!?
                Colors.grey:
                colors,
              ),
            ),
            ClipOval(
              child: Container(
                color: !firstConfirmed!?
                Colors.grey:
                colors,
                height: 40,
                width: 40,
                child: Center(
                  child: !secondConfirmed!?
                  const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ):
                  const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                color: !secondConfirmed!?
                Colors.grey:
                colors,
              ),
            ),
            ClipOval(
              child: Container(
                color: !secondConfirmed!?
                Colors.grey:
                colors,
                height: 40,
                width: 40,
                child: const Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8,),
        Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.access,
                style: TextStyles.textForm,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.data,
                style: TextStyles.textForm,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppLocalizations.of(context)!.address,
                style: TextStyles.textForm,
              ),
            ),
          ],
        )
      ],
    );

  }
}
