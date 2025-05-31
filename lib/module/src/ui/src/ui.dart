import 'package:dashboard/module/module.dart';
import 'package:flutter/material.dart';

final class UI {
  static const SizedBox empty = SizedBox.shrink();
  static const Spacer spacer = Spacer();

  static const Radius radiusBadge = Radius.circular(Values.radiusBadgeValue);
  static const Radius radiusButton = Radius.circular(Values.radiusButtonValue);
  static const Radius radiusCard = Radius.circular(Values.radiusCardValue);
  static const Radius radiusCircle = Radius.circular(Values.radiusCircleValue);
  static const Radius radiusDialog = Radius.circular(Values.radiusDialogValue);
  static const Radius radiusDialogButton = Radius.circular(Values.radiusDialogButtonValue);
  static const Radius radiusDropdownMenu = Radius.circular(Values.radiusDropdownMenuValue);
  static const Radius radiusGraph = Radius.circular(Values.radiusGraphValue);
  static const Radius radiusLabel = Radius.circular(Values.radiusLabelValue);
  static const Radius radiusTableHeader = Radius.circular(Values.radiusTableHeaderValue);
  static const Radius radiusText = Radius.circular(Values.radiusTextValue);
  static const Radius radiusTextField = Radius.circular(Values.radiusTextFieldValue);
  static const Radius radiusTooltip = Radius.circular(Values.radiusTooltipValue);

  static const BorderRadius borderRadiusBadge = BorderRadius.all(radiusBadge);
  static const BorderRadius borderRadiusButton = BorderRadius.all(radiusButton);
  static const BorderRadius borderRadiusCard = BorderRadius.all(radiusCard);
  static const BorderRadius borderRadiusCircle = BorderRadius.all(radiusCircle);
  static const BorderRadius borderRadiusDialog = BorderRadius.all(radiusDialog);
  static const BorderRadius borderRadiusDialogButton = BorderRadius.all(radiusDialogButton);
  static const BorderRadius borderRadiusDropdownMenu = BorderRadius.all(radiusDropdownMenu);
  static const BorderRadius borderRadiusGraphTop = BorderRadius.vertical(top: radiusGraph);
  static const BorderRadius borderRadiusLabel = BorderRadius.all(radiusLabel);
  static const BorderRadius borderRadiusTableHeader = BorderRadius.all(radiusTableHeader);
  static const BorderRadius borderRadiusText = BorderRadius.all(radiusText);
  static const BorderRadius borderRadiusTextField = BorderRadius.all(radiusTextField);
  static const BorderRadius borderRadiusTooltip = BorderRadius.all(radiusTooltip);
}
