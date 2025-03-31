import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
List<Map<String, dynamic>> transactionData=[
  {
    'icon':const FaIcon(FontAwesomeIcons.burger, color:Colors.white),
    'color':Colors.yellow[700],
    'name':'Food',
    'totalAmount':'-R 45.00',
     'data':'Today',
  },
  {
    'icon':const FaIcon(FontAwesomeIcons.bagShopping, color:Colors.white),
    'color':Colors.purple,
    'name':'Shopping',
    'totalAmount':'-R 867.00',
    'data':'Today',
  },
  {
    'icon':const FaIcon(FontAwesomeIcons.heartCircleCheck, color:Colors.white),
    'color':Colors.green,
    'name':'Health',
    'totalAmount':'-R 700.00',
    'data':'Today',
  },
  {
    'icon':const FaIcon(FontAwesomeIcons.plane, color:Colors.white),
    'color':Colors.blue,
    'name':'Travel',
    'totalAmount':'-R 867.00',
    'data':'Today',
  },
  {
    'icon':const FaIcon(FontAwesomeIcons.school, color:Colors.white),
    'color':Colors.red,
    'name':'School',
    'totalAmount':'-R 900.00',
    'data':'Today',
  },
  {
    'icon':const FaIcon(FontAwesomeIcons.house, color:Colors.white),
    'color':Colors.lightGreen,
    'name':'Home Accessories',
    'totalAmount':'-R 867.00',
    'data':'Today',
  },
];