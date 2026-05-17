import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  int selectedDateIndex = 0;

  // Example list of availability
  final List<Map<String, dynamic>> dateList = List.generate(10, (index) {
    final date = DateTime.now().add(Duration(days: index));
    return {
      'date': date,
      'available': index != 2 && index != 5, // Make some booked
    };
  });

  final List<String> timeSlots = [
    '10.00 AM',
    '11.00 AM',
    '01.00 PM',
    '01.10 PM', // Duplicate for demo
  ];

  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Horizontal Date Picker
        SizedBox(
          height: 48,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: dateList.length,
            itemBuilder: (context, index) {
              final item = dateList[index];
              final isSelected = index == selectedDateIndex;
              final isAvailable = item['available'] as bool;
              final date = item['date'] as DateTime;

              return GestureDetector(
                onTap:
                    isAvailable
                        ? () => setState(() {
                          selectedDateIndex = index;
                        })
                        : null,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimary100),
                    color:
                        isSelected
                            ? kSecondaryColor
                            : isAvailable
                            ? kPrimary100
                            : ktransparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.MMMMd().format(date),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: SFPRO,
                          fontWeight: wsemibold,
                        ),
                      ),
                      Text(
                        isAvailable ? 'Available' : 'Booked',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontFamily: SFPRO,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),
        MyText(
          text: "Pick Time",

          color: Colors.white,
          size: 16,
          fontFamily: SFPRO,
          paddingLeft: 20,
          paddingBottom: 16,
        ),

        // const SizedBox(height: 8),

        /// Time Picker Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 200, // Set appropriate height to contain the GridView
            child: GridView.builder(
              padding: EdgeInsets.all(0),
              physics:
                  const NeverScrollableScrollPhysics(), // Disable internal scroll if inside a scrollable parent
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Adjust for desired number of columns
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio:
                    2.5, // Adjust for width-to-height ratio of each item
              ),
              itemCount: timeSlots.length,
              itemBuilder: (context, index) {
                final time = timeSlots[index];
                final isSelected = selectedTime == time;
                return GestureDetector(
                  onTap: () => setState(() => selectedTime = time),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? kSecondaryColor : ktransparent,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: isSelected ? kSecondaryColor : kGreyColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        time,
                        style: TextStyle(
                          fontFamily: SFPRO,
                          color: isSelected ? Colors.white : kGreyColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
