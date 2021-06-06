import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'icon.dart';
WebViewController _controller;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.amber,
        ),
    home: WillPopScope( 
        onWillPop: ()async{
          String url = await _controller.currentUrl();
          if(url == 'https://www.mudraglobal.com'){
            return true;
          }else{
            _controller.goBack();
            return false;
          }
        } ,
        child:Scaffold(
          appBar: AppBar(title: Text('Mudra Global'),),
          floatingActionButton: SizedBox.fromSize(
            size: Size.square(60),
            child: FloatingActionButton(
              onPressed: (){
                FlutterOpenWhatsapp.sendSingleMessage("918595124865", "Hi \nWanted to inquire about ..");
              },
              child: Icon(MyFlutterApp.whatsapp,
              size: 40,),
              )
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body :WebView(
            initialUrl: 'https://www.mudraglobal.com',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          }),
        ),
      ),
    ));
}

IconData icon(){
  const IconData whatsapp = IconData(0xf232, fontFamily: 'MyFlutterApp', fontPackage: 'MyFlutterApp');
  return whatsapp;
}