import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsf/utils/AppConstants.dart';

class MyDropDown {
  List<DropdownMenuItem<String>> dropdownItems = [
    DropdownMenuItem(
      value: 'High',
      child: Text(
        'High',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: AppColors().textBlack,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Medium',
      child: Text(
        'Medium',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: AppColors().textBlack,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Low',
      child: Text(
        'Low',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: AppColors().textBlack,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ];
}
