import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../Helper/String.dart';
import '../Model/Section_Model.dart';
import '../Screen/Product Detail/productDetail.dart';
import '../repository/productListRespository.dart';
import '../repository/pushnotificationRepositry.dart';
import 'SettingProvider.dart';

class PushNotificationProvider extends ChangeNotifier {
  void registerToken(String? token, BuildContext context) async {
    SettingProvider settingsProvider =
        Provider.of<SettingProvider>(context, listen: false);
    var parameter = {
      FCM_ID: token,
    };
    if (settingsProvider.userId != null) {
      parameter[USER_ID] = settingsProvider.userId;
    }

    print('param noti gcm***$parameter');
    await NotificationRepository.updateFcmID(parameter: parameter)
        .then((value) {
      print('value notification****$value');

      if (value['error'] == false) {
        print('fcm token****$token');
        settingsProvider.setPrefrence(FCMTOKEN, token!);
      }
    });
  }

  Future<void> getProduct(
      String id, int index, int secPos, bool list, BuildContext context) async {
    try {
      var parameter = {
        ID: id,
      };

      var result = await ProductListRepository.getList(parameter: parameter);
      print('list result notification****$result');

      bool error = result['error'];
      if (!error) {
        var data = result['data'];
        print('data notification****$data');
        List<Product> items =
            (data as List).map((data) => Product.fromJson(data)).toList();
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => ProductDetail(
              index: int.parse(id),
              model: items[0],
              secPos: secPos,
              list: list,
            ),
          ),
        );
      } else {}
    } on Exception {}
  }
}
