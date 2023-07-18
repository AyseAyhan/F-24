import 'package:flutter/cupertino.dart';

class sporRepo extends ChangeNotifier{

  final hedef1 = [
    hedef('Ali','veli','mahmut'),

  ];
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
final hedef1Provider = ChangeNotifierProvider((ref){
return sporRepo();
});

ChangeNotifierProvider(sporRepo Function(dynamic ref) param0) {
}
class hedef{
  String Ad;
  String Tarihi;
  String Not;

  hedef(this.Ad,this.Tarihi,this.Not);
}
