import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:laserfast_app/app/modules/sessao/agendamento/models/hora_display.model.dart';
import 'package:laserfast_app/app/modules/sessao/agendamento/models/horarios_display.model.dart';
import 'package:laserfast_app/app/modules/sessao/sessao_store.dart';
import 'package:laserfast_app/app/shared/colors.dart';
import 'package:laserfast_app/app/shared/text_widget.dart';
import 'package:laserfast_app/app/shared/widgets/accordion_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HorariosDisponiveisWidget extends StatefulWidget {
  const HorariosDisponiveisWidget({super.key});

  @override
  State<HorariosDisponiveisWidget> createState() => _AvailableSchedulesState();
}

class _AvailableSchedulesState extends State<HorariosDisponiveisWidget> {
  final SessaoStore _store = Modular.get<SessaoStore>();
  final List<ScrollController> _scrollControllersList = [];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return (_store.horariosDisplay.isNotEmpty)
          ? Column(
              children: _store.horariosDisplay
                  .map((h) => AccordionWidget(
                        label: "Horários disponíveis - ${h.dia}",
                        content: _selectableCards(h),
                      ))
                  .toList(),
            )
          : const SizedBox();
    });
  }

  Widget _selectableCards(HorariosDisplayModel h) {
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
                children: h.horarios!.map((v) => _selectableCard(v)).toList(),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _selectableCard(HoraDisplay h) {
    late Color borderColor;
    late Color bgColor;
    late Color textColor;

    final bool hasSchedule = _store.horarioSelecionado != null;

    bool sameDate = false;

    if (hasSchedule) sameDate = h.valor == _store.horarioSelecionado;

    if (sameDate) {
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
          h.hora,
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
        if (_store.horarioSelecionado == null ||
            _store.horarioSelecionado != h.valor) {
          _store.selecionarHorario(h.valor!);
          _store.scrollToBottom();
        } else {
          _store.desselecionarHorario();
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
