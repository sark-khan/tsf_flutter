import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/AppConstants.dart';

class BoxShadows {
  BoxDecoration customDecoration(color, spreadRadius, blurRadius, offset) {
    return BoxDecoration(boxShadow: [
      BoxShadow(
          color: color,
          // Shadow color
          spreadRadius: spreadRadius,
          // Spread of the shadow
          blurRadius: blurRadius,
          // Blur radius of the shadow
          offset: offset)
    ]);
  }
  // return
}

class TopLayer {
  Widget topLayerWidget(String text, BuildContext context,
      {bool visiblity = true}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: visiblity,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ))),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    // if(Navigator.of)
                    // Navigator.
                    Navigator.of(context).pushNamed("/notification");
                  },
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                    color: AppColors().white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: 10,
              ),
              child: Text(
                text,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: AppColors().white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
