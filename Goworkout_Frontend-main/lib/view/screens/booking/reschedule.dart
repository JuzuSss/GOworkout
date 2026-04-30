import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class Reschedule extends StatefulWidget {
  const Reschedule({super.key, this.iscoach});
  final bool? iscoach;

  @override
  State<Reschedule> createState() => _RescheduleState();
}

class _RescheduleState extends State<Reschedule> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  String? _selectedTime;

  static const List<String> _slots = [
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
    '08:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Reschedule', centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        physics: const BouncingScrollPhysics(),
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() => _focusedDay = focusedDay);
            },
            calendarFormat: CalendarFormat.month,
            availableGestures: AvailableGestures.horizontalSwipe,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: kQuaternaryColor),
              weekendStyle: TextStyle(color: kQuaternaryColor),
            ),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              leftChevronVisible: true,
              rightChevronVisible: true,
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: kQuaternaryColor,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: kQuaternaryColor,
              ),
              titleTextStyle: TextStyle(
                color: kQuaternaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: SFPRO,
              ),
            ),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              defaultTextStyle: const TextStyle(color: kQuaternaryColor),
              weekendTextStyle: const TextStyle(color: kQuaternaryColor),
              todayDecoration: const BoxDecoration(
                color: kSecondaryColor,
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: kSecondaryColor,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: const TextStyle(color: kQuaternaryColor),
            ),
          ),
          const SizedBox(height: 24),
          MyText(
            text: _selectedDay == null
                ? 'Pick a date first'
                : 'Available slots — ${DateFormat('EEEE, MMM d').format(_selectedDay!)}',
            color: kQuaternaryColor,
            size: 16,
            weight: wsemibold,
            paddingBottom: 12,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final t in _slots)
                GestureDetector(
                  onTap: () => setState(() => _selectedTime = t),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: rounded2r(
                      _selectedTime == t
                          ? kSecondaryColor
                          : kPrimary100,
                      _selectedTime == t
                          ? kSecondaryColor
                          : kGrey5Color,
                      8,
                    ),
                    child: MyText(
                      text: t,
                      color: kQuaternaryColor,
                      size: 14,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 32),
          MyButton(
            onTap: () {
              if (_selectedDay == null || _selectedTime == null) {
                Get.snackbar(
                  'Reschedule',
                  'Please pick a date and a time slot.',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: kPrimary100,
                  colorText: kQuaternaryColor,
                );
                return;
              }
              Get.back();
              Get.snackbar(
                'Reschedule',
                'New session: ${DateFormat('MMM d').format(_selectedDay!)} at $_selectedTime — request sent to coach.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: kPrimary100,
                colorText: kQuaternaryColor,
              );
            },
            buttonText: 'Confirm Reschedule',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
