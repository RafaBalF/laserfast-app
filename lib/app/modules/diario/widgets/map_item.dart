import 'package:flutter_svg/svg.dart';
import 'package:laserfast_app/app/shared/interfaces/position.interface.dart';
import 'package:flutter/material.dart';

class MapItem extends StatelessWidget {
  final Function()? onPressed;
  final PositionInterface position;
  final bool desbloqueado;
  final bool usado;
  final String imagePath;

  const MapItem({
    super.key,
    required this.onPressed,
    required this.position,
    required this.desbloqueado,
    required this.usado,
    required this.imagePath,
  });

  factory MapItem.estrela({
    required Function()? onPressed,
    required PositionInterface? position,
    required bool desbloqueado,
    required bool usado,
  }) {
    final String path = desbloqueado
        ? 'assets/images/diario/estrela.svg'
        : 'assets/images/diario/estrela-apagada.svg';

    return MapItem(
      onPressed: (usado) ? () {} : onPressed,
      position: position ?? PositionInterface(),
      desbloqueado: desbloqueado,
      usado: usado,
      imagePath: path,
    );
  }

  factory MapItem.tesouro({
    required Function()? onPressed,
    required PositionInterface? position,
    required bool desbloqueado,
    required bool usado,
  }) {
    final String path = desbloqueado
        ? 'assets/images/diario/tesouro-aberto.svg'
        : 'assets/images/diario/tesouro-fechado.svg';

    return MapItem(
      onPressed: (usado) ? () {} : onPressed,
      position: position ?? PositionInterface(),
      desbloqueado: desbloqueado,
      usado: usado,
      imagePath: path,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.left,
      top: position.top,
      right: position.right,
      bottom: position.bottom,
      width: position.width,
      height: position.height,
      child: SvgPicture.asset(imagePath),
    );
  }
}
