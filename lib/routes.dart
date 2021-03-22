import 'package:flutter/material.dart';
import 'package:multi_ui/sections/bbva/bbva_page.dart';
import 'package:multi_ui/sections/finsus/finsus_page.dart';

final routesItems = [
  {
    "name": "BBVA",
    "subtitle": "Basado en: BBVA redesign app by Mauricio Lopez",
    "route": BbvaPage(),
    "icon": Icons.attach_money_rounded,
    "color": Color(0xFF004680)
  },
  {
    "name": "Finsus",
    "subtitle": "",
    "route": FinsusPage(),
    "icon": Icons.attach_money_rounded,
    "color": Color(0xFF0195CE)
  },
  {
    "name": "Find Out",
    "subtitle": "Basado en el diseño de Mauricio Lopez",
    "route": null,
    "icon": Icons.attach_money_rounded,
    "color": Color(0xFF0195CE)
  },
];
