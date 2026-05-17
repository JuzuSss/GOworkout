import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/auth/coach_setup/add_session.dart';
import 'package:go_workout/view/screens/auth/coach_setup/my_sessions.dart';
import 'package:go_workout/view/screens/booking/my_bookings.dart';
import 'package:go_workout/view/screens/home/home.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/icon_text_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/title_row.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

final _sizedBoxScrollController = ScrollController();
final _outerScrollController = ScrollController();
final _horScrollController = ScrollController();
double _previousOffset = 0;

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _outerScrollController,
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 20,
              ),
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification) {
                    if (notification.metrics.axis == Axis.vertical) {
                      // If scrolling stops inside the SizedBox, continue scrolling the outer SingleChildScrollView
                      if (notification.metrics.pixels >=
                          notification.metrics.maxScrollExtent) {
                        // Scrolling downward
                        _outerScrollController.animateTo(
                          _outerScrollController.offset + 100,
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.ease,
                        );
                      } else if (notification.metrics.pixels >= 0) {
                        // Scrolling upward
                        _outerScrollController.animateTo(
                          _outerScrollController.offset - 100,
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.ease,
                        );
                      }
                    } else if (notification.metrics.axis == Axis.horizontal) {
                      // If scrolling stops horizontally, do nothing
                    }
                  }
                  return false;
                },
                child: SingleChildScrollView(
                  controller: _sizedBoxScrollController,
                  child: MyCalender(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCalender extends StatefulWidget {
  const MyCalender({super.key, this.issessions});
  final bool? issessions;
  @override
  State<MyCalender> createState() => _MyCalenderState();
}

class _MyCalenderState extends State<MyCalender> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.week; // Default to week view
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> _events = {
    DateTime.utc(2025, 5, 8): [Event('Hair Services', '09:00 PM - 09:30 PM')],
    DateTime.utc(2025, 5, 17): [
      Event('Hair Services', '11:00 PM - 11:30 PM'),
      Event('Hair Services', '12:00 PM - 1:00 PM'),
      Event('Hair Services', '2:00 PM - 3:00 PM'),
    ],
  };
  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    _sizedBoxScrollController.dispose();
    _outerScrollController.dispose();
    //  _dessertsDataSource.dispose();
    _horScrollController.dispose();
    super.dispose();
  }

  void _toggleCalendarFormat() {
    setState(() {
      _calendarFormat =
          _calendarFormat == CalendarFormat.month
              ? CalendarFormat.week
              : CalendarFormat.month;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          // Align(
          //   alignment: Alignment.topRight,
          //   child: IconButton(
          //     onPressed: _toggleCalendarFormat,
          //     icon: Icon(
          //       _calendarFormat == CalendarFormat.month
          //           ? Icons.keyboard_arrow_up_rounded
          //           : Icons.keyboard_arrow_down_rounded,
          //       color: kQuaternaryColor,
          //     ),
          //   ),
          // ),
          RawGestureDetector(
            gestures: {
              VerticalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                VerticalDragGestureRecognizer
              >(() => VerticalDragGestureRecognizer(), (
                VerticalDragGestureRecognizer instance,
              ) {
                instance
                  ..onDown = (_) {}
                  ..onStart = (_) {}
                  ..onUpdate = (details) {
                    // Manually forward vertical drag to outer scroll controller
                    _outerScrollController.position.moveTo(
                      _outerScrollController.offset - details.delta.dy,
                    );
                  }
                  ..onEnd = (_) {};
              }),
            },
            behavior: HitTestBehavior.opaque,
            child: TableCalendar<Event>(
              headerVisible: true,

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
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.month,
              pageAnimationEnabled: false,
              pageJumpingEnabled: false,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedEvents.value = _getEventsForDay(selectedDay);
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              headerStyle: const HeaderStyle(
                titleCentered: false,
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
              ),

              eventLoader: _getEventsForDay,
              calendarStyle: CalendarStyle(
                markersMaxCount: 2,
                markersAutoAligned: true,
                markerDecoration: BoxDecoration(
                  color: kSecondaryColor,
                  shape: BoxShape.circle,
                ),
                outsideDaysVisible: false,
                cellPadding: const EdgeInsets.all(2),
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
                  return Container(
                    color: kPrimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10,
                      ),
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
                            text: '2025',
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
                            decoration: rounded2(ktransparent, kSecondaryColor),
                            child: Center(
                              child: MyText(
                                text: 'in 10 days',
                                paddingLeft: 5,
                                paddingRight: 5,
                                color: kSecondaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          //  ),
          const SizedBox(height: 16),
          ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              if (value.isEmpty) {
                return Text(
                  'No events for this day',
                  style: TextStyle(
                    color: kQuaternaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: SFPRO,
                  ),
                );
              }
              return Container(
                color: kPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TitleRow(
                        title:
                            widget.issessions == true
                                ? 'My Sessions'
                                : 'Current Bookings',
                        padends: 10,
                        onseeallTap: () {
                          if (widget.issessions == true) {
                            Get.to(() => MySessions(isauth: false));
                          } else {
                            Get.to(() => MyBookings());
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          final event = value[index];
                          return widget.issessions == true
                              ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: SessionsTile(
                                  ontap: () {
                                    Get.to(
                                      () => AddSession(
                                        isauth: false,
                                        title: 'Reschedule Session',
                                      ),
                                    );
                                  },
                                ),
                              )
                              : Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 0),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 3,
                                          height: 98,
                                          color: kSecondaryColor,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: kPrimary100,
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                    right: Radius.circular(12),
                                                  ),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    spacing: 5,

                                                    children: [
                                                      MyText(
                                                        text: event.time,
                                                        size: 16,
                                                        weight: wbold,
                                                      ),
                                                      IconTextRow(
                                                        iconpath:
                                                            Assets.imagesMaker,
                                                        iconcolor: kGrey5Color,
                                                        iconsize: 14,
                                                        text:
                                                            'Bronx, New York(NY)',
                                                      ),
                                                      Row(
                                                        spacing: 3,
                                                        children: [
                                                          Icon(
                                                            Icons.circle,
                                                            size: 12,
                                                            color:
                                                                kSecondaryColor,
                                                          ),
                                                          Expanded(
                                                            child: MyText(
                                                              size: 12,
                                                              color:
                                                                  kGrey5Color,
                                                              text:
                                                                  '2 hours session with Jordan Rivers',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                //SizedBox(width: 10),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: CommonImageView(
                                        svgPath: Assets.imagesSend2,
                                        height: 35,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Event {
  final String title;
  final String time;
  Event(this.title, this.time);
}
