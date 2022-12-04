import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HostelPhoto extends StatelessWidget {
  const HostelPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          14.heightBox,
          "Gym".text.bold.xl.color(context.primaryColor).make().px16(),
          Image.network("https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/559/2018/10/18/Gymnasium%20of%20Graphic%20Era%20University%20Dehradun_Gymnasium.png").p12(),
          14.heightBox,
          "Rooms".text.bold.xl.color(context.primaryColor).make().px16(),
          Image.network("https://www.geu.ac.in/content/dam/geu/Image-Galleries/rules/hostel/hostel-03.jpg").p12(),
          Image.network("https://www.geu.ac.in/content/dam/geu/Image-Galleries/rules/hostel/hostel-01.jpg").p12(),
          14.heightBox,
          "Mess".text.bold.xl.color(context.primaryColor).make().px16(),
          Image.network("https://www.geu.ac.in/content/dam/geu/facility/mess.jpg").p12(),
          14.heightBox,
          "Refreshment Zone".text.bold.xl.color(context.primaryColor).make().px16(),
          Image.network("https://www.hostelz.com/pics/hostels/owner/big/85/3663985.jpg").p12(),
        ],
      ),
    );
  }
}