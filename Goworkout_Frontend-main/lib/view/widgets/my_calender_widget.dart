import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class Event {
  final String title;
  final String time;
  Event(this.title, this.time);
}

class MyCalendarWidget extends StatelessWidget {
  final Map<DateTime, List<Event>> events;
  final DateTime selectedDay;
  final DateTime focusedDay;
  final Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  const MyCalendarWidget({
    Key? key,
    required this.events,
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
  }) : super(key: key);

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar<Event>(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: onDaySelected,
      eventLoader: _getEventsForDay,
      calendarFormat: CalendarFormat.month,
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) {
          List<String> weekDaysAbbreviations = [
            'M',
            'T',
            'W',
            'T',
            'F',
            'S',
            'S',
          ];
          return weekDaysAbbreviations[date.weekday - 1];
        },
        weekdayStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: SFPRO,
          color: kQuaternaryColor,
        ),
        weekendStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: SFPRO,
          color: kQuaternaryColor,
        ),
      ),
      headerStyle: const HeaderStyle(
        titleCentered: false,
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      calendarStyle: CalendarStyle(
        markersMaxCount: 2,
        markersAutoAligned: true,
        markerDecoration: BoxDecoration(
          color: kSecondaryColor,
          shape: BoxShape.circle,
        ),
        outsideDaysVisible: false,
        cellMargin: EdgeInsets.all(6),
        todayDecoration: BoxDecoration(
          color: kSecondaryColor,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: kSecondaryColor,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(
          fontSize: 13,
          color: kQuaternaryColor,
          fontWeight: FontWeight.w500,
        ),
        defaultTextStyle: TextStyle(
          fontSize: 13,
          color: kQuaternaryColor,
          fontWeight: FontWeight.w500,
          fontFamily: SFPRO,
        ),
        todayTextStyle: TextStyle(
          fontSize: 13,
          color: kQuaternaryColor,
          fontWeight: FontWeight.w500,
          fontFamily: SFPRO,
        ),
        weekendTextStyle: TextStyle(
          fontSize: 13,
          color: kQuaternaryColor,
          fontWeight: FontWeight.w500,
          fontFamily: SFPRO,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, date) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  DateFormat('MMMM').format(date),
                  style: TextStyle(
                    color: kQuaternaryColor,
                    fontSize: 33,
                    fontWeight: wbold,
                    fontFamily: SFPRO,
                  ),
                ),
                MyText(
                  text: DateFormat('y').format(date),
                  size: 16,
                  color: kQuaternaryColor,
                  paddingTop: 10,
                  paddingLeft: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: kQuaternaryColor,
                    size: 24,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kSecondaryColor),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  child: MyText(text: 'in 10 days', color: kSecondaryColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
