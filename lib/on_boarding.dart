import 'package:flutter/material.dart';
import 'package:flutter_onboarding/data/data.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  PageController? _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              itemCount: contents.length,
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Image.asset(contents[index].image),
                      const Spacer(),
                      Text(
                        contents[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Palanquin-Bold",
                          fontSize: 28.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[index].discription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Palanquin-Regular",
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex == contents.length - 1) {
                      //Go to next page
                    }
                    _controller!.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff54B6CC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: Text(
                      currentIndex == contents.length - 1
                          ? "Get Started"
                          : "Next",
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                    (index) => buildDot(index, context),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: 6,
      width: currentIndex == index ? 24 : 6,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.white : Colors.white24,
      ),
    );
  }
}
