import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:natrium_wallet_flutter/appstate_container.dart';
import 'package:natrium_wallet_flutter/network/model/response/alerts_response_item.dart';
import 'package:natrium_wallet_flutter/styles.dart';

class RemoteMessageCard extends StatefulWidget {
  final AlertResponseItem alert;

  final Function onPressed;

  RemoteMessageCard({
    this.alert,
    this.onPressed,
  });

  _RemoteMessageCardState createState() => _RemoteMessageCardState();
}

class _RemoteMessageCardState extends State<RemoteMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: StateContainer.of(context).curTheme.success.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: StateContainer.of(context).curTheme.success,
        ),
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        highlightColor:
            StateContainer.of(context).curTheme.success.withOpacity(0.15),
        splashColor:
            StateContainer.of(context).curTheme.success.withOpacity(0.15),
        onPressed: widget.onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(DateTime.fromMicrosecondsSinceEpoch(
                              int.parse("123123123123123") * 1000)
                          .toIso8601String()),
                    ],
                  ),
                  widget.alert.title != null
                      ? Container(
                          child: Text(
                            widget.alert.title,
                            style: AppStyles.remoteMessageCardTitle(context),
                          ),
                        )
                      : SizedBox(),
                  widget.alert.shortDescription != null
                      ? Container(
                          margin: EdgeInsetsDirectional.only(
                            top: 4,
                          ),
                          child: Text(
                            widget.alert.shortDescription,
                            style: AppStyles.remoteMessageCardShortDescription(
                                context),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
