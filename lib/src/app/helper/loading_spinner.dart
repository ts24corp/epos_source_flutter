import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner {
  static Widget loadingView({BuildContext context, bool loading}) {
    if (loading)
      return Center(
        // child: SpinKitWave(
        //     color: Theme.of(context).primaryColor, type: SpinKitWaveType.start),
        child: SpinKitThreeBounce(
          color: Theme.of(context).primaryColor,
          size: 40,
        ),
      );

    return Container();
  }
}
