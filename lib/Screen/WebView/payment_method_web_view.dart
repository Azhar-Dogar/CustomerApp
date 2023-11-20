// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
class WebViewExample extends StatefulWidget {
   WebViewExample({this.url, this.msg, this.amt, this.from, this.orderId});
   final String? url, from, msg, amt, orderId;
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  late PlatformWebViewController _controller ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(widget.url!),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Flutter WebView example'),
      //   actions: <Widget>[
      //     _SampleMenu(_controller),
      //   ],
      // ),
      body: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: _controller),
      ).build(context),
    );
  }
}

enum _MenuOptions {
  doPostRequest,
}

class _SampleMenu extends StatelessWidget {
  const _SampleMenu(this.controller);

  final PlatformWebViewController controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MenuOptions>(
      onSelected: (_MenuOptions value) {
        switch (value) {
          case _MenuOptions.doPostRequest:
            _onDoPostRequest(controller);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<_MenuOptions>>[
        const PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.doPostRequest,
          child: Text('Post Request'),
        ),
      ],
    );
  }

  Future<void> _onDoPostRequest(PlatformWebViewController controller) async {
    final LoadRequestParams params = LoadRequestParams(
      uri: Uri.parse('https://httpbin.org/post'),
      method: LoadRequestMethod.post,
      headers: const <String, String>{
        'foo': 'bar',
        'Content-Type': 'text/plain'
      },
      body: Uint8List.fromList('Test Body'.codeUnits),
    );
    await controller.loadRequest(params);
  }
  // Future<void> AddTransaction(String tranId, String orderID, String status,
  //     String? msg, bool redirect) async {
  //   try {
  //     var parameter = {
  //       USER_ID: CUR_USERID,
  //       ORDER_ID: orderID,
  //       TYPE: context.read<CartProvider>().payMethod,
  //       TXNID: tranId,
  //       AMOUNT: context.read<CartProvider>().totalPrice.toString(),
  //       STATUS: status,
  //       MSG: msg
  //     };
  //
  //     Response response =
  //     await post(addTransactionApi, body: parameter, headers: headers)
  //         .timeout(const Duration(seconds: timeOut));
  //
  //     DateTime now = DateTime.now();
  //     currentBackPressTime = now;
  //     var getdata = json.decode(response.body);
  //
  //     bool error = getdata['error'];
  //     String? msg1 = getdata['message'];
  //     if (!error) {
  //       if (redirect) {
  //         userProvider.setCartCount('0');
  //         context.read<CartProvider>().promoAmt = 0;
  //         context.read<CartProvider>().remWalBal = 0;
  //         context.read<CartProvider>().usedBalance = 0;
  //         context.read<CartProvider>().payMethod = null;
  //         context.read<CartProvider>().isPromoValid = false;
  //         context.read<CartProvider>().isUseWallet = false;
  //         context.read<CartProvider>().isPayLayShow = true;
  //         context.read<CartProvider>().selectedMethod = null;
  //         context.read<CartProvider>().totalPrice = 0;
  //         context.read<CartProvider>().oriPrice = 0;
  //         context.read<CartProvider>().taxPer = 0;
  //         context.read<CartProvider>().deliveryCharge = 0;
  //         Routes.navigateToOrderSuccessScreen(context);
  //       }
  //     } else {
  //       setSnackbar(msg1!, context);
  //     }
  //   } on TimeoutException catch (_) {
  //     setSnackbar(getTranslated(context, 'somethingMSg')!, context);
  //   }
  // }
}