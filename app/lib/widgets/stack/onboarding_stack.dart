import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class OnboardingStack extends StatelessWidget {
  const OnboardingStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //spacifay of  size stack 
      width: context.getWight(),
      height: context.getHight() * .55,
    
      child: Stack(
        clipBehavior: Clip.none,//dont cut 
        children: [
          //left
          Positioned(//take this postion 
            right: context.getWight() * .7,
            top: context.getHight() * .01,
              //dispaly image with spiccsic disayn 
            child: Container(
              width: context.getWight() * .27,
              height: context.getHight() * .27,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color.fromARGB(255, 224, 215, 215), width: 7.0),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/2.png"),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          // make tmageto rgth 
          Positioned(
            bottom: context.getHight() * .34,//spacfify bottom & left
            left: context.getWight() * .6,

            child: Container(
              width: context.getWight() * .28,//give it width & height
              height: context.getHight() * .28,

              decoration: BoxDecoration(
                shape: BoxShape.circle,//make it circle 
                border: Border.all(color: const Color.fromARGB(255, 224, 215, 215), width: 7.0),//colo border with width
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/1.png"),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          // second row
          Positioned(
            left: -context.getWight() * .14,
            top: context.getHight() * .2,
            child: Container(
              width: context.getWight() * .28,
              height: context.getHight() * .28,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color.fromARGB(255, 224, 215, 215), width: 7.0),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/4.png"),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          //center
          Positioned(
            left: context.getWight() * .3,
            top: context.getHight() * .1,
            child: Container(
              width: context.getWight() * .35,
              height: context.getHight() * .35,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color.fromARGB(255, 224, 215, 215), width: 7.0),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/5.png"),
                backgroundColor: Colors.white,
              ),
            ),
          ),

          Positioned(
            left: context.getWight() * .81,
            top: context.getHight() * .2,
            child: Container(
              width: context.getWight() * .24,
              height: context.getHight() * .24,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color.fromARGB(255, 224, 215, 215), width: 7.0),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/3.png"),
                backgroundColor: Colors.white,
              ),
            ),
          ),

          Positioned(
            left: context.getWight() * .1,
            top: context.getHight() * .38,
            child: Container(
              width: context.getWight() * .20,
              height: context.getHight() * .20,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color.fromARGB(255, 224, 215, 215), width: 7.0),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/6.png"),
                backgroundColor: Colors.white,
              ),
            ),
          ),

          Positioned(
            left: context.getWight() * .4,
            top: context.getHight() * .34,
            child: Container(
              width: context.getWight() * .22,
              height: context.getHight() * .22,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color.fromARGB(255, 224, 215, 215), width: 7.0),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/7.png"),
                backgroundColor: Colors.white,
              ),
            ),
          ),

          
          Positioned(
            left: context.getWight() * .75,
            top: context.getHight() * .35,
            child: Container(
              width: context.getWight() * .15,
              height: context.getHight() * .15,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color.fromARGB(255, 224, 215, 215), width: 7.0),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/8.png"),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
