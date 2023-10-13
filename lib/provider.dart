import 'package:flutter/cupertino.dart';

class Provider_class extends ChangeNotifier{
  List favname = [];
  List favimage = [];
  List favprice = [];

  List get favoritename => favname;
  List get favoriteimage => favimage;
  List get favoriteprice => favprice;

  void favorites(String imagepath, name, unit, price) {
    final favnameList = favname.contains(name);
    if (favnameList) {
      favname.remove(name);
      favimage.remove(imagepath);

      favprice.remove(price);
    } else {
      favname.add(name);
      favimage.add(imagepath);

      favprice.add(price);
    }
    notifyListeners();
  }
}