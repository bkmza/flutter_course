import 'package:flutter/material.dart';
// import 'package:map_view/map_view.dart';

import '../helpers/ensure-visible.dart';

class LocationInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  Uri _staticMapUri;
  final FocusNode _addressInputFocusNode = FocusNode();

  @override
  void initState() {
    _addressInputFocusNode.addListener(_updateLocation);
    // getStaticMap();
    super.initState();
  }

  @override
  void dispose() {
    _addressInputFocusNode.removeListener(_updateLocation);
    super.dispose();
  }

  // void getStaticMap() async {
  //   final StaticMapProvider staticMapViewProvider =
  //       StaticMapProvider('AIzaSyAikos_w0Ace_QBwOUivBTHGBWeIG-DNg8');
  //   final Uri staticMapUri = staticMapViewProvider.getStaticUriWithMarkers(
  //       [Marker('position', 'Position', 41.40338, 2.17403)],
  //       center: Location(41.40338, 2.17403),
  //       width: 500,
  //       height: 300,
  //       maptype: StaticMapViewType.roadmap);
  //   setState(() {
  //     _staticMapUri = staticMapUri;
  //   });
  // }

  void _updateLocation() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EnsureVisibleWhenFocused(
          focusNode: _addressInputFocusNode,
          child: TextFormField(
            focusNode: _addressInputFocusNode,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Image.network(_staticMapUri.toString())
      ],
    );
  }
}
