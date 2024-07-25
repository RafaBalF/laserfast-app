import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:laserfast_app/app/models/available_schedule.model.dart';
import 'package:laserfast_app/app/modules/agenda/agenda_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/accordion_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AvailableSchedulesWidget extends StatefulWidget {
  const AvailableSchedulesWidget({super.key});

  @override
  State<AvailableSchedulesWidget> createState() => _AvailableSchedulesState();
}

class _AvailableSchedulesState extends State<AvailableSchedulesWidget> {
  final AgendaStore _store = Modular.get<AgendaStore>();
  final List<ScrollController> _scrollControllersList = [];

  final DateFormat ddmmFormatter = DateFormat('dd/MM');
  final DateFormat hhmmFormatter = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return (_store.availableSchedules.isNotEmpty)
          ? Column(
              children: _store.availableSchedules
                  .map((s) => AccordionWidget(
                        label:
                            "Horários disponíveis - ${ddmmFormatter.format(s.day!)}",
                        content: _selectableCards(s),
                      ))
                  .toList(),
            )
          : const SizedBox();
    });
  }

  Widget _selectableCards(AvailableSchedulesModel s) {
    final ScrollController scrollController = ScrollController();
    _scrollControllersList.add(scrollController);

    return Container(
      height: 20.h,
      width: 100.w,
      color: grey,
      child: RawScrollbar(
        thumbColor: accent,
        trackColor: grey,
        trackBorderColor: grey,
        thumbVisibility: true,
        thickness: 10.sp,
        minThumbLength: 5.h,
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(builder: (_) {
              return Wrap(
                spacing: 2.w,
                runSpacing: 1.h,
                children:
                    s.schedules!.map((v) => _selectableCard(s, v)).toList(),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _selectableCard(AvailableSchedulesModel schedule, DateTime date) {
    late Color borderColor;
    late Color bgColor;
    late Color textColor;

    final bool hasSchedule = _store.selectedSchedule != null;

    bool sameDay = false;
    bool sameHour = false;

    if (hasSchedule) {
      sameDay = date.day == _store.selectedSchedule!.selectedDate!.day;
      sameHour = date.hour == _store.selectedSchedule!.selectedDate!.hour;
    }

    if (sameDay && sameHour) {
      borderColor = accent;
      bgColor = accent;
      textColor = white;
    } else {
      borderColor = grey;
      bgColor = background;
      textColor = darkGrey;
    }

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: borderColor),
          color: bgColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 1.h),
        child: textWidget(
          hhmmFormatter.format(date),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: textColor,
            height: 1.2,
          ),
        ),
      ),
      onTap: () {
        if (_store.selectedSchedule == null) {
          _store.selectSchedule(schedule, date);
        } else if (_store.selectedSchedule!.selectedDate != date) {
          _store.selectSchedule(schedule, date);
        } else {
          _store.selectSchedule(null, null);
        }
      },
    );
  }

  @override
  void dispose() {
    for (var c in _scrollControllersList) {
      c.dispose();
    }

    super.dispose();
  }
}
