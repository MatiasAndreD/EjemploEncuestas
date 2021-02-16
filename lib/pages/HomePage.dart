import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:prueba_formgoogle_app/preferences/preference_liststate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController controller;
  String url;
  String currentUrl;
  int _id;
  bool _estado;

  /*  final prefs = new PreferenciasUsuario(); */

  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    /*   _id = prefs.id;
    _estado = prefs.estado; */
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;

    url = args;

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Form'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: progress < 1.0
                      ? LinearProgressIndicator(value: progress)
                      : Container()),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: InAppWebView(
                    initialUrl: url,
                    initialHeaders: {},
                    initialOptions: InAppWebViewGroupOptions(
                        crossPlatform:
                            InAppWebViewOptions(debuggingEnabled: true)),
                    onWebViewCreated: (webViewController) =>
                        controller = webViewController,
                    onLoadStart: (controller, url) {
                      setState(() async {
                        this.url = url;
                        currentUrl = await controller.getUrl();
                        final c = currentUrl.split(
                          "/formResponse",
                        );
                        if (c.length == 1) {}
                      });
                    },
                    onLoadStop: (controller, url) {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onProgressChanged: (controller, progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
