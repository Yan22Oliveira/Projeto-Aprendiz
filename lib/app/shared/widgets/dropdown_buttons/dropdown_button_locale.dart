import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../shared/shared.dart';

class DropdownButtonLocale extends StatefulWidget {

  const DropdownButtonLocale({Key? key}) : super(key: key);
  @override
  State<DropdownButtonLocale> createState() => _DropdownButtonLocaleState();
}

class _DropdownButtonLocaleState extends State<DropdownButtonLocale> {

  @override
  Widget build(BuildContext context) {

    var language = Provider.of<AppLocale>(context);

    String? dropdownValue = (language.locale == const Locale('en')) ? 'English' : 'Português';

    return DropdownButton<String>(
      value: dropdownValue,
      alignment: Alignment.center,
      isDense: true,
      isExpanded: false,
      elevation: 2,
      borderRadius: BorderRadius.circular(4),
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: AppColors.black,
      ),
      iconSize: 30,
      style: TextStyles.formText,
      underline: Container(
        color: AppColors.background,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
        dropdownValue == 'Português' ?
        language.changeLocale(const Locale('pt')) :
        language.changeLocale(const Locale('en'));
      },
      items: <String>['English','Português',]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
}
