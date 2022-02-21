import 'package:flutter/material.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../students.dart';
import '../../../../../../shared/shared.dart';

class StudentsDataTableMobile extends StatefulWidget {

  final List<StudentModel> listStudents;
  const StudentsDataTableMobile({
    required this.listStudents,
    Key? key,
  }) : super(key: key);

  @override
  State<StudentsDataTableMobile> createState() => _StudentsDataTableMobileState();
}

class _StudentsDataTableMobileState extends State<StudentsDataTableMobile> {

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(AppColors.orange),
            headingRowHeight: 48,
            horizontalMargin: 24,
            columns: <DataColumn>[

              DataColumn(
                label: Text(
                  tradutor!.actions,
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
            rows: widget.listStudents.map(
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
        ),
      ),
    );
  }

}
