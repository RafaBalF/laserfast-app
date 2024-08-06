import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:laserfast_app/app/modules/sessao/agendamento/widgets/available_schedules_widget.dart';
import 'package:laserfast_app/app/modules/sessao/sessao_store.dart';
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

class AgendamentoPage extends StatefulWidget {
  final int? sessionId;
  const AgendamentoPage({
    super.key,
    this.sessionId,
  });
  @override
  AgendamentoPageState createState() => AgendamentoPageState();
}

class AgendamentoPageState extends State<AgendamentoPage> {
  final SessaoStore _store = Modular.get<SessaoStore>();
  late final Future<void> _future;

  final DateRangePickerController _controller = DateRangePickerController();

  final DateFormat ddmmmyyyyFormatter = DateFormat('dd MMM yyyy');
  final DateFormat ddmmFormatter = DateFormat('dd/MM');
  final DateFormat hhmmFormatter = DateFormat('HH:mm');

  @override
  void initState() {
    _future = Future.wait([_store.initAgendamento(widget.sessionId)]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'AGENDAMENTO',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Selecione as áreas'),
        DividerWidget(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedDateCard('De', _store.startDate, 'Data início'),
            _selectedDateCard('Até', _store.endDate, 'Data fim'),
          ],
        ),
        DividerWidget(height: 2.h),
        Center(
          child: GestureDetector(
            onTap: _onSelectDateRange,
            child: Container(
              width: 70.w,
              height: 10.h,
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(2),
              ),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
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

  void _onSelectDateRange() {
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
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
      onCancel: () {
        Modular.to.pop();
      },
      onSubmit: (v) {
        if (_controller.selectedRange == null) {
          return showErrorBottomSheet(
            context,
            message: 'Selecione um período de tempo',
          );
        }

        DateTime startDate = _controller.selectedRange!.startDate!;
        DateTime endDate = _controller.selectedRange!.endDate ?? startDate;

        _store.setStartDate(startDate);
        _store.setEndDate(endDate);

        _store.resetSchedules();
        _store.resetSessionArea();

        _store.getSessionAreas();

        Modular.to.pop();
      },
    );

    showCustomBottomSheet(context, 'Selecione um período', rangeDatePicker);
  }

  Widget _areaPickerSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _sectionHeader('Selecione as áreas'),
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
    final BorderRadius cardsBorderRadius = BorderRadius.circular(10);

    return Observer(builder: (_) {
      if (_store.selectedSchedule != null) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _sectionHeader('Tempo sessão'),
          DividerWidget(height: 2.h),
          Container(
            width: 100.w,
            height: 15.h,
            decoration: BoxDecoration(
              color: lightGrey,
              borderRadius: cardsBorderRadius,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 2.w,
              vertical: 1.h,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(
                        'Início',
                        textAlign: TextAlign.start,
                        style: profileTile(color: darkGrey),
                      ),
                      DividerWidget(height: 0.5.h),
                      Observer(builder: (_) {
                        final String formattedStartHour = hhmmFormatter
                            .format(_store.selectedSchedule!.selectedDate!);

                        return textWidget(
                          formattedStartHour,
                          textAlign: TextAlign.center,
                          style: h2(color: black),
                        );
                      }),
                    ],
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 26.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(
                        'Até',
                        textAlign: TextAlign.start,
                        style: profileTile(color: darkGrey),
                      ),
                      DividerWidget(height: 0.5.h),
                      Observer(builder: (_) {
                        DateTime endHour = _store
                            .selectedSchedule!.selectedDate!
                            .add(Duration(minutes: _store.sessionDuration));

                        final String formattedEndHour =
                            hhmmFormatter.format(endHour);

                        return textWidget(
                          formattedEndHour,
                          textAlign: TextAlign.center,
                          style: h2(color: black),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          DividerWidget(height: 5.h),
          Observer(builder: (_) {
            return ButtonWidget.filled(
              onPressed: () async {
                var r = await _store.submit();

                if (!mounted) return;

                showBaseModalBottomSheet(
                  context,
                  r,
                  onSuccessPressed: () {
                    Modular.to.pop();
                    Modular.to.pop();

                    Modular.to.pushNamed('/historico/');
                  },
                  onErrorPressed: () {},
                  dismissable: false,
                  onClose: () {
                    Modular.to.pop();
                  },
                );
              },
              backgroundColor: accent,
              title: 'CONFIRMAR',
              textColor: white,
              disabled: _store.selectedSchedule == null,
              loading: _store.loadingStore.isLoading,
            );
          }),
          DividerWidget(height: 5.h),
        ]);
      } else {
        return SizedBox(height: 3.h);
      }
    });
  }

  Widget _sectionHeader(String header) {
    return textWidget(
      header,
      style: h2(),
      textAlign: TextAlign.start,
    );
  }

  Widget _selectedDateCard(String header, DateTime? date, String fallof) {
    return Container(
      width: 30.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: grey),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.h,
      ),
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            header,
            textAlign: TextAlign.start,
            style: profileTile(color: darkGrey),
          ),
          DividerWidget(height: 0.5.h),
          Observer(builder: (_) {
            String formattedDate = (date != null)
                ? ddmmmyyyyFormatter.format(date)
                : 'Data início';

            return textWidget(
              formattedDate,
              textAlign: TextAlign.center,
              style: label(color: accent),
            );
          }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _store.resetAgendamento();

    _controller.dispose();

    super.dispose();
  }
}
