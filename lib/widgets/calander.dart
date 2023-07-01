import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:abushakir/abushakir.dart';
import 'BottomNav.dart';
import '../widgets/chart.dart';

class Calander extends StatelessWidget {
  const Calander({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calender"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            height: 400,
            child: SfCalendar(
              dataSource: EthDateSource(),
              allowViewNavigation: true,
              dragAndDropSettings: DragAndDropSettings(showTimeIndicator: true),
              headerHeight: 75,
              showDatePickerButton: true,
              // showNavigationArrow: true,
              headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle:
                      TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              view: CalendarView.month,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class EthDateSource extends CalendarDataSource {
  @override
  DateTime getStartTime(int index) {
    return DateTime(
      2020,4,
    );
    // Implement your logic to convert the Ethiopian date to Gregorian date
  }

  @override
  DateTime getEndTime(int index) {
    return DateTime(2030, 4, 15);
    // Implement your logic to convert the Ethiopian date to Gregorian date
  }


}
