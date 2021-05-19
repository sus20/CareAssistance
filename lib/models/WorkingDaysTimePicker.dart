import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkingDaysTimePickerWidget extends StatefulWidget {
  final String workingDay;

  const WorkingDaysTimePickerWidget({Key key, this.workingDay})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new WorkingDaysTimePickerWidgetState();
}

class WorkingDaysTimePickerWidgetState
    extends State<WorkingDaysTimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.workingDay + ':',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          WidgetSpan(
            child: Container(
              width: 38,
              height: 18,
              child: DateTimeField(
                resetIcon: null,
                format: DateFormat("HH:mm"),
                decoration: InputDecoration(
                    alignLabelWithHint: false,
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.all(3)),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.convert(time);
                },
              ),
            ),
          ),
          TextSpan(
            text: "bis",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          WidgetSpan(
            child: Container(
              width: 38,
              height: 18,
              child: DateTimeField(
                resetIcon: null,
                format: DateFormat("HH:mm"),
                decoration: InputDecoration(
                    alignLabelWithHint: false,
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.all(3)),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.convert(time);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
