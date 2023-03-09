import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'match_recap_event_video_model.dart';
export 'match_recap_event_video_model.dart';

class MatchRecapEventVideoWidget extends StatefulWidget {
  const MatchRecapEventVideoWidget({
    Key? key,
    this.videoURL,
  }) : super(key: key);

  final String? videoURL;

  @override
  _MatchRecapEventVideoWidgetState createState() =>
      _MatchRecapEventVideoWidgetState();
}

class _MatchRecapEventVideoWidgetState
    extends State<MatchRecapEventVideoWidget> {
  late MatchRecapEventVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchRecapEventVideoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30.0,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Video Replay',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: FlutterFlowVideoPlayer(
        path: widget.videoURL!,
        videoType: VideoType.network,
        autoPlay: false,
        looping: true,
        showControls: true,
        allowFullScreen: true,
        allowPlaybackSpeedMenu: true,
      ),
    );
  }
}
