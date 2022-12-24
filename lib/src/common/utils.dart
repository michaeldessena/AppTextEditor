import 'package:flutter/material.dart';

late double SCREENWIDTH;
late double SCREENHEIGHT;

double getScreenWidth(BuildContext context){
  SCREENWIDTH = MediaQuery.of(context).size.width;
  return SCREENWIDTH;
}

double getScreenHeight(BuildContext context){
  SCREENHEIGHT = MediaQuery.of(context).size.height;
  return SCREENHEIGHT;
}

