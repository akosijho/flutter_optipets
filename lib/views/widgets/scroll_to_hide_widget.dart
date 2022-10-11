import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';

class ScrollToHide extends StatelessWidget{
  const ScrollToHide({Key? key, required this.widget, required this.controller, required this.duration, required this.height}) : super(key: key);

  final Widget widget;
  final ScrollController controller;
  final Duration duration;
  final double height;
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScrollToHideViewModel>.reactive(
      viewModelBuilder: () => ScrollToHideViewModel(controller), 
      onModelReady: (model) => model.init(),
      builder: (context, viewModel, child){
        return AnimatedContainer(
          duration: duration,
          height: viewModel.isVisible ? height : 0,
          child: Wrap(children: [widget]),);
      });
  }

}

class ScrollToHideViewModel extends BaseViewModel{
  bool isVisible = true;
  ScrollController controller;
  ScrollToHideViewModel(this.controller);

  void init(){
    controller.addListener(listen);
  }

  void listen(){
    final direction = controller.position.userScrollDirection;
    if(direction == ScrollDirection.forward){
      show();
    }
    if(direction == ScrollDirection.reverse){
      hide();
    }
    notifyListeners();
  }

  void show(){
    isVisible = true;
    notifyListeners();
  }

  void hide(){
    isVisible = false;
    notifyListeners();
  }
}