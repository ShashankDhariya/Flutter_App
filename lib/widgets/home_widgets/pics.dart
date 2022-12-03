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
          "Gym".text.bold.make().px16().py4(),
          Image.network("https://cache.careers360.mobi/media/presets/720X480/colleges/social-media/media-gallery/559/2018/10/18/Gymnasium%20of%20Graphic%20Era%20University%20Dehradun_Gymnasium.png").p16(),
          "Rooms".text.bold.make().px16(),
          Image.network("https://www.geu.ac.in/content/dam/geu/Image-Galleries/rules/hostel/hostel-03.jpg").p16(),
          Image.network("https://www.geu.ac.in/content/dam/geu/Image-Galleries/rules/hostel/hostel-01.jpg").p16(),
          "Mess".text.bold.make().px16(),
          Image.network("https://www.geu.ac.in/content/dam/geu/facility/mess.jpg").p16(),
        ],
      ),
    );
  }
}