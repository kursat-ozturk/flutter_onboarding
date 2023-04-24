class UnboardingContent {
  String image;
  String title;
  String discription;

  UnboardingContent({
    required this.title,
    required this.image,
    required this.discription,
  });
}

List<UnboardingContent> contents = [
  UnboardingContent(
    title: 'Boost Productivity',
    image: 'assets/image1.png',
    discription: "We help you boost your productivity on a differnet level",
  ),
  UnboardingContent(
    title: 'Work Seamlessly',
    image: 'assets/image2.png',
    discription: "Get your work done seamlessly without interruption",
  ),
  UnboardingContent(
    title: 'Achieve Higher Goals',
    image: 'assets/image3.png',
    discription:
        "By boosting your producivity we help you achieve higher goals",
  ),
];
