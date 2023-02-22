import 'package:flutter/material.dart';

class DefaultLoading extends StatefulWidget {
  bool loading = false;
  Widget child;
  DefaultLoading({Key? key,required this.child, this.loading = false}) : super(key: key);

  @override
  _DefaultLoadingState createState() => _DefaultLoadingState();
}

class _DefaultLoadingState extends State<DefaultLoading> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
        absorbing: widget.loading,
        child: Stack(
          children: [
            widget.child,
            if(widget.loading) Container(
              color: Colors.grey.shade50.withOpacity(0.4),
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        )
    );
  }
}
