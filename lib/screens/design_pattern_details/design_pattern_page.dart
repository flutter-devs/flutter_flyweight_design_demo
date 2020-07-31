import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flyweight_design_demo/constants.dart';
import 'package:flutter_flyweight_design_demo/repo/modal/design_model.dart';
import 'package:flutter_flyweight_design_demo/repo/repositories/markdown_repository.dart';
import 'package:flutter_flyweight_design_demo/screens/design_pattern_details/design_pattern_header.dart';
import 'package:flutter_flyweight_design_demo/utils/custom/custom_back_button.dart';
import 'package:flutter_flyweight_design_demo/utils/fade_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


class DesignPatternDetails extends StatefulWidget {
  final DesignPattern designPattern;
  final Widget example;

  const DesignPatternDetails({
    @required this.designPattern,
    @required this.example,
  })  : assert(designPattern != null),
        assert(example != null);

  @override
  _DesignPatternDetailsState createState() => _DesignPatternDetailsState();
}

class _DesignPatternDetailsState extends State<DesignPatternDetails>
    with TickerProviderStateMixin {
  final MarkdownRepository repository = MarkdownRepository();

  final double _contentAnimationIntervalStart = 0.65;
  final double _preferredAppBarHeight = 56.0;

  AnimationController _fadeSlideAnimationController;
  ScrollController _scrollController;
  TabController _tabController;
  double _appBarElevation = 0.0;
  double _appBarTitleOpacity = 0.0;
  double _bottomNavigationBarElevation = 4.0;

  @override
  void initState() {
    super.initState();

    _fadeSlideAnimationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _appBarElevation =
              _scrollController.offset > _scrollController.initialScrollOffset
                  ? 4.0
                  : 0.0;
          _appBarTitleOpacity = _scrollController.offset >
                  _scrollController.initialScrollOffset +
                      _preferredAppBarHeight / 2
              ? 1.0
              : 0.0;
          _bottomNavigationBarElevation = _scrollController.offset ==
                  _scrollController.position.maxScrollExtent
              ? 0.0
              : 4.0;
        });
      });

    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _fadeSlideAnimationController.dispose();
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void onBottomNavigationBarItemTap(int index) {
    setState(() {
      _appBarElevation = 0.0;
      _appBarTitleOpacity = 0.0;
      _bottomNavigationBarElevation = 4.0;
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FadeTransitionScreen(
        controller: _fadeSlideAnimationController,
        slideAnimationTween: Tween<Offset>(
          begin: Offset(0.0, 1.0),
          end: Offset(0.0, 0.0),
        ),
        begin: _contentAnimationIntervalStart,
        end: 1.0,
        child: BottomNavigationBar(
          currentIndex: _tabController.index,
          backgroundColor: Colors.pink[200],
          elevation: _bottomNavigationBarElevation,
          selectedIconTheme: IconThemeData(size: 20.0),
          selectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(size: 20.0),
          unselectedItemColor: Colors.black45,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text('Data'),
              icon: Icon(FontAwesomeIcons.file,color: Colors.greenAccent,),
            ),
            BottomNavigationBarItem(
              title: Text('Demo'),
              icon: Icon(FontAwesomeIcons.solidLightbulb,color: Colors.greenAccent,),
            ),
          ],
          onTap: onBottomNavigationBarItemTap,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Hero(
            tag: "${widget.designPattern.id}",
            child: Container(
              color: Colors.pink[200],
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                FadeTransitionScreen(
                  controller: _fadeSlideAnimationController,
                  slideAnimationTween: Tween<Offset>(
                    begin: Offset(0.0, 0.5),
                    end: Offset(0.0, 0.0),
                  ),
                  begin: 0.0,
                  end: _contentAnimationIntervalStart,
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(_preferredAppBarHeight),
                    child: AppBar(
                      title: AnimatedOpacity(
                        opacity: _appBarTitleOpacity,
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          widget.designPattern.title,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.pink[200],
                      elevation: _appBarElevation,
                      leading: CustomBackButton(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      ScrollConfiguration(
                        behavior: ScrollBehavior(),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          padding: const EdgeInsets.fromLTRB(
                            paddingL,
                            paddingZero,
                            paddingL,
                            paddingL,
                          ),
                          child: Column(
                            children: <Widget>[
                              FadeTransitionScreen(
                                controller: _fadeSlideAnimationController,
                                slideAnimationTween: Tween<Offset>(
                                  begin: Offset(0.0, 0.25),
                                  end: Offset(0.0, 0.0),
                                ),
                                begin: 0.0,
                                end: _contentAnimationIntervalStart,
                                child: DesignPatternHeader(
                                  designPattern: widget.designPattern,
                                ),
                              ),
                              const SizedBox(height: spaceL),
                              FadeTransitionScreen(
                                controller: _fadeSlideAnimationController,
                                slideAnimationTween: Tween<Offset>(
                                  begin: Offset(0.0, 0.01),
                                  end: Offset(0.0, 0.0),
                                ),
                                begin: _contentAnimationIntervalStart,
                                end: 1.0,
                                child: FutureBuilder(
                                  future:
                                      repository.get(widget.designPattern.id),
                                  initialData: "",
                                  builder: (_, AsyncSnapshot<String> snapshot) {
                                    if (snapshot.hasData) {
                                      return MarkdownBody(
                                        data: snapshot.data,
                                      );
                                    }

                                    return CircularProgressIndicator(
                                      backgroundColor: lightBackgroundColor,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.black.withOpacity(0.65),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      widget.example,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
