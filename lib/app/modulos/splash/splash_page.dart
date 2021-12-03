import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../../shared/shared.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {

  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!, curve: Curves.easeInCirc,
      ),
    );
    _animationController!.forward();

    Future.delayed(const Duration(seconds: 3)).then((value) async {
      //Carregar as depedências async do modular
      await Modular.isModuleReady<AppModule>();
      Modular.to.navigate('/access/login');
    });

  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FadeTransition(
          opacity: _animation!,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AppImages.logoDiv,
                height: 280,
              )
            ],
          ),
        ),
      ),
    );
  }

}