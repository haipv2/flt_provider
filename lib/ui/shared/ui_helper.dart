import 'package:flutter/material.dart';


class UIHelper {
  // vertical spacing constants.
  static const double _verticalSpaceSmall = 10.0;
  static const double _verticalSpaceMedium = 20.0;
  static const double _verticalSpaceLarge = 60.0;

  //horizontal spacing constants
  static const double _horizontalSpaceSmall = 10.0;
  static const double _horizontalSpaceMedium = 20.0;
  static const double _horizontalSpaceLarge = 60.0;

  static Widget verticalSpaceSmall(){
    return verticalSpace(_verticalSpaceSmall);
  }

  static Widget verticalSpace(double height) {
    return Container(height: height,);
  }

  static Widget verticalSpaceMedium(){
    return verticalSpace(_verticalSpaceMedium);
  }

  static Widget verticalSpaceLarge (){
    return verticalSpace(_verticalSpaceLarge);
  }

  static horizontalSpace(double width){
    return new Container(width: width,);
  }

  static Widget horizontalSpaceSmall(){
    return horizontalSpace(_horizontalSpaceSmall);
  }

  static Widget horizontalSpaceMedium(){
    return horizontalSpace(_horizontalSpaceMedium);
  }

  static Widget horizontalSpaceLarge(){
    return horizontalSpace(_horizontalSpaceLarge);
  }

}
