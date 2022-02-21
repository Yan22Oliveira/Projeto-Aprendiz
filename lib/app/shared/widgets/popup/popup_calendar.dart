import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../shared.dart';
import '../../../modulos/modulos.dart';

class PopupCalendar extends StatefulWidget {

  final String title;
  final Function(DatesModel?)? onPressed;
  const PopupCalendar({
    required this.title,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<PopupCalendar> createState() => _PopupCalendarState();
}

class _PopupCalendarState extends State<PopupCalendar> {

  var datesModel = DatesModel();

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 3,
      backgroundColor: AppColors.background,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 460,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                const SizedBox(height: 8,),

                Text(
                  widget.title,
                  style: TextStyles.textDropdownButton,
                ),

                const SizedBox(height: 16,),

                SfDateRangePicker(
                  backgroundColor: AppColors.background,
                  //initialSelectedRange: const PickerDateRange(),
                  onSelectionChanged: (DateRangePickerSelectionChangedArgs args){
                    setState(() {
                      if(args.value.startDate != null){
                        datesModel.initialDate = args.value.startDate.toString().substring(0,10);
                      }
                      if(args.value.endDate!=null){
                        datesModel.finalDate = args.value.endDate.toString().substring(0,10);
                      }
                    });
                  },
                  onCancel: (){
                    datesModel = DatesModel();
                    widget.onPressed!(datesModel);
                    Modular.to.pop();
                  },
                  onSubmit: (object){
                    widget.onPressed!(datesModel);
                    Modular.to.pop();
                  },
                  showActionButtons: true,
                  selectionMode: DateRangePickerSelectionMode.range,
                  selectionColor: AppColors.primary,
                  todayHighlightColor: AppColors.primary,
                  startRangeSelectionColor: AppColors.orange,
                  endRangeSelectionColor: AppColors.orange,
                  minDate: DateTime(2022),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
