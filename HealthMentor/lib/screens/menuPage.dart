import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Color.fromARGB(255, 68, 28, 151),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/profile.jpg',
                        height: 60, width: 60),
                    SizedBox(width: 10),
                    Text('Student',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 250,
                        height: 160,
                        margin: EdgeInsets.only(top: 25),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/chat.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Chat with PrepPal',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Topics',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        padding: EdgeInsets.all(10),
                        children: [
                          _buildTopicCard(context, '/exam',
                              'assets/images/exam.jpg', 'Exam', 'Preparation'),
                          _buildTopicCard(
                              context,
                              '/stress',
                              'assets/images/stress.jpg',
                              'Stress',
                              'Management'),
                          _buildTopicCard(context, '/fitness',
                              'assets/images/fitness.jpg', 'Fitness', ''),
                          _buildTopicCard(context, '/nutrition',
                              'assets/images/nutrition.jpg', 'Nutrition', ''),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopicCard(BuildContext context, String route, String imagePath,
      String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Image.asset(imagePath, width: 100, height: 100),
          Text(title,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
          if (subtitle.isNotEmpty)
            Text(subtitle,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
