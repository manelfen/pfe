import 'package:flutter/material.dart';

const basicBackground =  BoxDecoration(
    gradient: LinearGradient(
        colors: [
          // Colors.
          Color(0xFFE0F2F1),
          Color(0xFF004D40),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp));

const greyDivider = Divider(
    color: Colors.grey,
);

const sizedBoxTen = SizedBox(height: 10);

const sizedBoxTwenty = SizedBox(height: 20);

const sizedBoxForty = SizedBox(height: 40);