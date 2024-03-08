import 'package:flutter/material.dart';
import 'package:electronics_app/constants/colorres.dart';
import 'package:electronics_app/utils/app_text.dart';

class CommonStepperScreen extends StatefulWidget {
  const CommonStepperScreen({Key? key}) : super(key: key);

  @override
  State<CommonStepperScreen> createState() => _CommonStepperScreenState();
}

class _CommonStepperScreenState extends State<CommonStepperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all()),
            child: horizontalSteeper(status: "pending"),
          ),
          horizontalSteeper(status: "completed"),
        ],
      ),
    );
  }
}

Widget dot({required String status}) {
  return Container(
    height: 15,
    width: 15,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: getColor(status: status)),
  );
}

Widget horizontalSteeper({required String status}) {
  return Row(
    children: [
        AppText(
          appText: 'Status',
          style: AppTextStyle(
              fontSize: 12,
              color: ColorRes.greyA0A4AB,
              fontWeight: FontWeight.bold)),
      const SizedBox(
        width: 10,
      ),
      dot(status: status),
      hline(status: status),
      dot(status: status),
      hline(status: status),
      dot(status: status),
      hline(status: status),
      dot(status: status),
    ],
  );
}

Widget hline({required String status}) {
  return Expanded(
      child: Divider(
    color: getColor(status: status),
  ));
}

Color getColor({required String status}) {
  if (status == "delivery") {
    return ColorRes.blue;
  } else if (status == "Processing") {
    return ColorRes.purple2B0752;
  }else if (status == "Stepped") {
    return ColorRes.orangeF16522;
  }else if (status == "Confirmed") {
    return ColorRes.purple2B0752;
  } else {
    return ColorRes.whiteE8F1FF;
  }
}
