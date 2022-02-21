import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatusIcon extends StatelessWidget {

  final int status;
  const StatusIcon({
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    switch (status) {
      case 0:
        return IconButton(
          icon: const Icon(
            FontAwesomeIcons.userClock,
            color: Colors.grey,
          ),
          tooltip: tradutor!.waiting,
          onPressed: (){},
        );
      case 1:
        return IconButton(
          icon: const Icon(
            FontAwesomeIcons.check,
            color: Colors.green,
          ),
          tooltip: tradutor!.active,
          onPressed: (){},
        );
      case 2:
        return IconButton(
          icon: const Icon(
            FontAwesomeIcons.times,
            color: Colors.red,
          ),
          tooltip: tradutor!.blocked,
          onPressed: (){},
        );
      default:
        return const SizedBox();
    }

  }

}
