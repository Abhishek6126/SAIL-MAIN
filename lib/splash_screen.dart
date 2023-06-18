import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sail_test/presentation/login_screen/login_screen.dart'; // Update the import statement with the correct path to LoginPage

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  bool _isAnimationComplete = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _slideAnimation = Tween<double>(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward().whenComplete(() {
      setState(() {
        _isAnimationComplete = true;
      });
    });

    Future.delayed(Duration(milliseconds: 3000), () {
      if (_isAnimationComplete) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 900),
            pageBuilder: (_, __, ___) => LoginScreen(),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return FadeScaleTransition(
                animation: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double imageSize = constraints.maxWidth * 0.6;

              return FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0, 0),
                        end: Offset.zero,
                      ).animate(_slideAnimation),
                      child: Image.asset(
                        'assets/images/img_saillogo1.png', // Update with the correct image path
                        width: imageSize,
                        height: imageSize,
                      ),
                    ),
                    SizedBox(height: 0.2 * imageSize),
                    Text(
                      'MES APP\nBSP,SAIL',
                      style: TextStyle(
                        fontSize: 0.2 * imageSize,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
