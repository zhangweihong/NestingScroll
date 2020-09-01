import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NestingScrollWidget extends StatelessWidget {
  const NestingScrollWidget({
    Key key,
    @required this.child,
    @required this.parentScrollController,
  }) : super(key: key);
  final Widget child;
  final ScrollController parentScrollController;
  @override
  Widget build(BuildContext context) {
    Drag _parentDrag;
    return NotificationListener<OverscrollNotification>(
      onNotification: (ntf) {
        if (ntf.dragDetails == null) {
          _parentDrag = null;
          return false;
        }
        if (_parentDrag == null) {
          _parentDrag = parentScrollController.position.drag(
              DragStartDetails(
                  localPosition: ntf.dragDetails.localPosition,
                  globalPosition: ntf.dragDetails.globalPosition), () {
            _parentDrag = null;
          });
        } else {
          _parentDrag.update(ntf.dragDetails);
        }
        return true;
      },
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (ntf) {
          if (_parentDrag != null && ntf.dragDetails != null) {
            _parentDrag.end(ntf.dragDetails);
          }
          _parentDrag = null;
          return true;
        },
        child: child,
      ),
    );
  }
}
