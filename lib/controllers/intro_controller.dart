class IntroController {
  void Function(void Function() fn) updater;
  double carImageOpacity = 1;

  IntroController(this.updater){
    changeOpacity();
  }

  void changeOpacity() async {
    await Future.delayed(const Duration(seconds: 1));
    carImageOpacity = 0;
    updater(() {});
  }
}