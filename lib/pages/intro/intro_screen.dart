import 'package:flutter/material.dart';
import 'package:rebirth_draft_2/pages/OnBoarding/onboarding_screen.dart';
import 'package:slide_to_act/slide_to_act.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _showQuote = false;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final GlobalKey _slideKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -5.43),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    Future.delayed(const Duration(milliseconds: 600), () {
      _controller.forward().then((_) {
        setState(() {
          _showQuote = true;
        });
        _fadeController.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void navigateWithRadialTransition() {
    RenderBox renderBox =
        _slideKey.currentContext!.findRenderObject() as RenderBox;
    Offset center = renderBox.localToGlobal(renderBox.size.center(Offset.zero));

    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (context, animation, secondaryAnimation) {
          return const OnboardingScreen(); // <-- return is now ensured
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, _) {
                    double radius =
                        animation.value *
                        MediaQuery.of(context).size.longestSide *
                        1.2;
                    return ClipPath(
                      clipper: CircleClipper(center: center, radius: radius),
                      child: child,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey, Colors.grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Center(
            child:
                _showQuote
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Rebirth.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                'The journey of a thousand miles begins with one step.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "-Lao Tzu",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: SlideAction(
                              key: _slideKey,
                              outerColor: Colors.grey[900],
                              innerColor: Colors.white,
                              elevation: 4,
                              height: 70,
                              sliderButtonIcon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                              text: 'Let\'s Begin',
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                              onSubmit: () async {
                                await Future.delayed(
                                  const Duration(milliseconds: 300),
                                );
                                navigateWithRadialTransition(); // Explicit return to satisfy nullable Future
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                    : SlideTransition(
                      position: _offsetAnimation,
                      child: const Text(
                        'Rebirth.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  final Offset center;
  final double radius;

  CircleClipper({required this.center, required this.radius});

  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(CircleClipper oldClipper) {
    return radius != oldClipper.radius || center != oldClipper.center;
  }
}
