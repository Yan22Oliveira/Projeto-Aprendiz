import 'package:flutter/material.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../teachers.dart';
import '../../../../../../shared/shared.dart';

class TeachersDataTableWeb extends StatefulWidget {

 final List<TeacherModel> listTeachers;
  const TeachersDataTableWeb({
    required this.listTeachers,
    Key? key,
  }) : super(key: key);

  @override
  State<TeachersDataTableWeb> createState() => _TeachersDataTableWebState();
}

class _TeachersDataTableWebState extends State<TeachersDataTableWeb> {

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: DataTable2(
        scrollController: _scrollController,
        headingRowColor: MaterialStateProperty.all(AppColors.orange),
        headingRowHeight: 48,
        horizontalMargin: 24,
        empty: empty(context,tradutor!),
        columns: <DataColumn>[

          DataColumn(
            label: Text(
              tradutor.actions,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              tradutor.status,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              tradutor.id,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          DataColumn2(
            label: Text(
              tradutor.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            size: ColumnSize.L,
          ),

          DataColumn2(
            label: Text(
              tradutor.email,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            size: ColumnSize.L,
          ),

          DataColumn2(
            label: Text(
              tradutor.telephone,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            size: ColumnSize.L,
          ),

          DataColumn2(
            label: Text(
              tradutor.church,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            size: ColumnSize.L,
          ),

        ],
        rows: widget.listTeachers.map(
              (data) => DataRow(
            cells: [

              DataCell(
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.searchPlus,
                    color: Colors.green,
                  ),
                  tooltip: tradutor.information,
                  onPressed: (){
                    //Modular.to.pushNamed('/secretary/edit_list_churches/', arguments: data,);
                  },
                ),
              ),
              DataCell(
                StatusIcon(status: data.ativo!,),
              ),
              DataCell(
                Text(data.id!.toString()),
              ),
              DataCell(
                Text(
                  data.user!.nome!,
                ),
              ),
              DataCell(
                Text(
                  data.user!.email!,
                ),
              ),
              DataCell(
                Text(
                  Formatters().formatPhone(data.user!.telefone!),
                ),
              ),
              DataCell(
                Text(
                  data.user!.igreja!.nome!,
                ),
              ),

            ],
          ),
        ).toList(),
      ),
    );
  }

 Widget empty(BuildContext context,AppLocalizations tradutor){
   return Center(
     child: Padding(
       padding: const EdgeInsets.symmetric(vertical: 40),
       child: Text(tradutor.noDataAvailable),
     ),
   );
 }

}
