import 'package:flutter/material.dart';
import '../../../screens/login_screen/animations/change_screen_animation.dart';
import '../../../utils/helper_functions.dart';
import 'login_content.dart';

//animasyon ayarlari
class TopText extends StatefulWidget 
{
  const TopText({Key? key}) : super(key: key);

  @override
  State<TopText> createState() => _TopTextState();
}

class _TopTextState extends State<TopText> 
{
  @override
  void initState() 
  {
    ChangeScreenAnimation.topTextAnimation.addStatusListener((status) 
    {
      if (status == AnimationStatus.completed) 
      {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    return HelperFunctions.wrapWithAnimatedBuilder(
      animation: ChangeScreenAnimation.topTextAnimation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Text(
          ChangeScreenAnimation.currentScreen == Screens.signUp
              ? 'Hesap Oluştur'
              : 'Hoş geldin',
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}