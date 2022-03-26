import 'package:flutter/material.dart';
import 'package:ipresent/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

enum DialogType {
  basic,
  form,
}
void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.basic: (context, sheetRequest, completer) =>
        _BasicDialog(request: sheetRequest, completer: completer),
    DialogType.form: (context, sheetRequest, completer) =>
        _FormDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _BasicDialog extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;
  const _BasicDialog({Key? key, this.request, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            request!.title!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            request!.description!,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => completer!(DialogResponse(confirmed: true)),
            child: Container(
              child: request!.showIconInMainButton!
                  ? Icon(Icons.check_circle)
                  : Text(request!.mainButtonTitle!),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class _FormDialog extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;
  _FormDialog({Key? key, this.request, this.completer}) : super(key: key);
  var controller = useTextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              request!.title!,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
                controller: controller,
                cursorColor: Color(0xFFd60404),
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFd60404)),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 80,
                  child: GestureDetector(
                    onTap: () => completer!(
                        DialogResponse(responseData: request!.mainButtonTitle)),
                    child: Container(
                      child: Text(
                        request!.mainButtonTitle!,
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFd60404)),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        //color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 80,
                  child: GestureDetector(
                    onTap: () => completer!(
                        DialogResponse(responseData: [controller.text])),
                    child: Container(
                      child: Text(
                        request!.secondaryButtonTitle!,
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFd60404)),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        //color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
