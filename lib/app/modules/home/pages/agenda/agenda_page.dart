import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:laserfast_app/app/modules/home/pages/agenda/agenda_store.dart';
import 'package:laserfast_app/app/modules/home/pages/agenda/widgets/available_schedules_widget.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/modal_bottom_sheet.dart';
import 'package:laserfast_app/app/shared/text_styles.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/button_widget.dart';
import 'package:laserfast_app/app/shared/widgets/divider_widget.dart';
import 'package:laserfast_app/app/shared/widgets/selectable_cards_widget.dart';
import 'package:laserfast_app/app/shared/widgets/shimmer_widget.dart';
import 'package:laserfast_app/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});
  @override
  AgendaPageState createState() => AgendaPageState();
}

class AgendaPageState extends State<AgendaPage> {
  final AgendaStore _store = Modular.get<AgendaStore>();
  late final Future<void> _future;

  final DateRangePickerController _controller = DateRangePickerController();

  final DateFormat ddmmmyyyyFormatter = DateFormat('dd MMM yyyy');
  final DateFormat ddmmFormatter = DateFormat('dd/MM');

  @override
  void initState() {
    _future = Future.wait([_store.init()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'AGENDAMENTO',
            useDefaultPadding: false,
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return _body();
                  });
                } else {
                  return _loadingBody();
                }
              },
            ));
      },
    );
  }

  Widget _loadingBody() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DividerWidget(height: 3.h),
          SizedBox(
            height: 10.h,
            width: 100.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 3.w),
                  child: ShimmerWidget(width: 20.w, height: 25.h),
                );
              },
            ),
          ),
          DividerWidget(height: 3.h),
          SizedBox(
            height: 5.h,
            width: 90.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShimmerWidget(width: 70.w, height: 4.h),
                ShimmerWidget(width: 15.w, height: 4.h),
              ],
            ),
          ),
          DividerWidget(height: 3.h),
          ShimmerWidget(width: 90.w, height: 12.h),
          DividerWidget(height: 2.h),
          ShimmerWidget(width: 90.w, height: 12.h),
          DividerWidget(height: 3.h),
          SizedBox(
            height: 25.h,
            width: 100.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: ShimmerWidget(width: 43.w, height: 10.h),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    final double spacing = 3.h;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _datePickerSection(),
        DividerWidget(height: spacing),
        _areaPickerSection(),
        DividerWidget(height: spacing),
        _sessionDurationSection(),
        DividerWidget(height: spacing),
      ],
    );
  }

  Widget _datePickerSection() {
    final double cardsWidth = 30.w;
    final BorderRadius cardsBorderRadius = BorderRadius.circular(10);
    final EdgeInsets cardsPadding = EdgeInsets.symmetric(
      horizontal: 2.w,
      vertical: 1.h,
    );
    final EdgeInsets cardsMargin = EdgeInsets.symmetric(horizontal: 2.w);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          'Data',
          style: h2(),
          textAlign: TextAlign.start,
        ),
        DividerWidget(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: cardsWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: grey),
              ),
              padding: cardsPadding,
              margin: cardsMargin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    'De',
                    textAlign: TextAlign.start,
                    style: profileTile(color: darkGrey),
                  ),
                  DividerWidget(height: 0.5.h),
                  Observer(builder: (_) {
                    String startDate = (_store.startDate != null)
                        ? ddmmmyyyyFormatter.format(_store.startDate!)
                        : 'Data início';

                    return textWidget(
                      startDate,
                      textAlign: TextAlign.center,
                      style: label(color: accent),
                    );
                  }),
                ],
              ),
            ),
            Container(
              width: cardsWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: grey),
              ),
              padding: cardsPadding,
              margin: cardsMargin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    'Até',
                    textAlign: TextAlign.start,
                    style: profileTile(color: darkGrey),
                  ),
                  DividerWidget(height: 0.5.h),
                  Observer(builder: (_) {
                    String endDate = (_store.endDate != null)
                        ? ddmmmyyyyFormatter.format(_store.endDate!)
                        : 'Data fim';

                    return textWidget(
                      endDate,
                      textAlign: TextAlign.center,
                      style: label(color: accent),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
        DividerWidget(height: 2.h),
        Center(
          child: GestureDetector(
            onTap: () {
              final DateTime today = DateTime.now();
              final DateTime aMonthFromNow =
                  DateTime(today.year, today.month + 1, today.day);

              final rangeDatePicker = SfDateRangePicker(
                controller: _controller,
                backgroundColor: background,
                headerStyle: const DateRangePickerHeaderStyle(
                  backgroundColor: background,
                ),
                minDate: today,
                maxDate: aMonthFromNow,
                selectionMode: DateRangePickerSelectionMode.range,
                showActionButtons: true,
                onCancel: () {
                  Modular.to.pop();
                },
                onSubmit: (v) {
                  // print(v);
                  if (_controller.selectedRange == null) {
                    return showErrorBottomSheet(
                      context,
                      message: 'Selecione um período de tempo',
                    );
                  }

                  DateTime startDate = _controller.selectedRange!.startDate!;
                  DateTime endDate =
                      _controller.selectedRange!.endDate ?? startDate;

                  _store.setStartDate(startDate);
                  _store.setEndDate(endDate);

                  _store.getSessionAreas();

                  Modular.to.pop();
                },
              );

              showCustomBottomSheet(
                  context, 'Selecione um período', rangeDatePicker);
            },
            child: Container(
              width: 70.w,
              height: 10.h,
              decoration: BoxDecoration(
                color: grey,
                borderRadius: cardsBorderRadius,
              ),
              padding: cardsPadding,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                      'Escolher um período',
                      style: h2(color: black),
                    ),
                    textWidget(
                      'Clique aqui',
                      style: text(color: black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _areaPickerSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      textWidget(
        'Selecione as áreas',
        style: h2(),
        textAlign: TextAlign.start,
      ),
      DividerWidget(height: 2.h),
      Observer(builder: (_) {
        return textWidget(
          'Tempo de sessão: ${_store.sessionDuration} minutos',
          style: label(),
          textAlign: TextAlign.start,
        );
      }),
      DividerWidget(height: 2.h),
      Observer(builder: (_) {
        return (_store.sessionAreas.isNotEmpty)
            ? SelectableCardsWidget(
                height: 20.h,
                items: _store.sessionAreas.toList(),
              )
            : const SizedBox();
      }),
      DividerWidget(height: 2.h),
      Observer(builder: (_) {
        return ButtonWidget.filled(
          onPressed: () {
            _store.getAvailableSchedules();
          },
          backgroundColor: accent,
          title: 'BUSCAR HORÁRIOS',
          textColor: white,
          disabled: _store.selectedSessionAreas.isEmpty,
          loading: _store.loadingStore.isLoading,
        );
      }),
      DividerWidget(height: 2.h),
      const AvailableSchedulesWidget(),
    ]);
  }

  Widget _sessionDurationSection() {
    return Observer(builder: (_) {
      return (_store.selectedSchedule != null)
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              textWidget(
                'Tempo sessão',
                style: h2(),
                textAlign: TextAlign.start,
              ),
              DividerWidget(height: 2.h),
            ])
          : SizedBox(height: 3.h);
    });
  }

  @override
  void dispose() {
    _store.reset();

    _controller.dispose();

    super.dispose();
  }
}
