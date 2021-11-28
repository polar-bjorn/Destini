import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'story_brain.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/road.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 27.0,
                      fontFamily: 'IrishGrover',
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(

                  style:

                  TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: Colors.blueGrey[400].withOpacity(0.3),
                  ),

                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'IrishGrover',
                      color: Colors.grey[200],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Colors.blueGrey[400].withOpacity(0.3),
                    ),

                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });

                    },

                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'IrishGrover',
                        color: Colors.grey[200],
                      ),
                    ),
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