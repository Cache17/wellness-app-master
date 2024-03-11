import 'package:flutter/material.dart';

//Constructor Stuff
class WellnessActivity {
  final String image;
  final String name;
  final String description;

  WellnessActivity({
    required this.image,
    required this.name,
    required this.description,
  });
}

//List of Wellness Activities
List<WellnessActivity> wellnessActivities = [
  WellnessActivity(
    image: "assets/images/YFSWellnessCentre.PNG",
    name: "Wellness Centre",
    description: "$WellnessCentreDes",
  ),
  WellnessActivity(
    image: "assets/images/Tait.png",
    name: "Tait McKenzie",
    description: "$Tait",
  ),
   WellnessActivity(
    image: "assets/images/Club.png",
    name: "Join A Club",
    description: "$Club",
  ),
  WellnessActivity(
    image: "assets/images/Biking.png",
    name: "Biking On Campus",
    description: "$Bike",
  ),
   WellnessActivity(
    image: "assets/images/Podcast.png",
    name: "Podcasts",
    description: "$Podcasts",
  ),
   WellnessActivity(
    image: "assets/images/Calumet.PNG",
    name: "Wellness Lounge",
    description: "$Calumet",
  ),
   WellnessActivity(
    image: "assets/images/Walk.png",
    name: "Walk On Campus",
    description: "$Walk",
  ),
   WellnessActivity(
    image: "assets/images/Yoga.png",
    name: "Yoga & Meditation",
    description: "$Yoga",
  ),
   WellnessActivity(
    image: "assets/images/Sports.png",
    name: "Sports/Intramurals",
    description: "$Sports",
  ),
];

//UI Stuff And Display 
class WellnessDetailPage extends StatelessWidget {
  final WellnessActivity? wellnessActivity;

  WellnessDetailPage({this.wellnessActivity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child:Column(
        children: [
          // Display details of wellness activity
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${wellnessActivity?.name ?? 'Unknown'}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${wellnessActivity?.description ?? 'No description available'}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}

//Descriptions

final String WellnessCentreDes = '''
The YFS Wellness Centre is the culmination of student lobbying, input, and struggle spanning more than a decade. 
The space as it exists is a fluid thing that will stretch and shrink with student need, in order to best suit the York community. 
The walls of the Wellness Centre will provide a space to relax, inquire, and challenge for the betterment of both yourself, and the community. 
This space is student-run, and operates autonomously from York University. The Wellness Centre is accessible to students all year round, 
it focuses on four main pillars of operation: Mental Health, Physical Health, Sexual Violence and Harm Reduction.

For more information: https://www.yfswellness.ca/
''';

final String Tait = '''Engaging in regular physical activity and maintaining an active lifestyle are key components of promoting overall wellness. 
You can do this on campus by visiting the Tait Mckenzie fitness centre.
Exercise not only contributes to physical health by improving cardiovascular fitness, strength, and flexibility but also plays a crucial role in mental well-being. 
It helps reduce stress, anxiety, and depression, while releasing endorphins that enhance mood and foster a sense of happiness. 
Additionally, staying active supports weight management, boosts immune function, and enhances sleep quality. 
Embracing a consistent workout routine is a holistic approach to wellness, fostering a healthier and more balanced life. 

For more information: https://yorkulions.ca/sports/2013/4/12/GEN_0412133336.aspx''';

final String Club = '''Joining a university club promotes wellness by fostering a supportive community, providing a break from academic stress, and encouraging personal growth. 
It creates opportunities for social connections, intellectual stimulation, and a sense of belonging, contributing to a more balanced and fulfilling university experience.

For more information: https://yorku.campuslabs.ca/engage/
''';

final String Bike = '''You can rent a bike on campus to improve your wellness! Through Bike Share Toronto you can access these bikes across these locations on campus: 
Keele	North and south sides of the York University Subway Station
The Pond Rd. and Sentinel
The Pond Rd. and Shoreham
Track and Field Centre 
For more information:https://www.yorku.ca/transportation/bike-share-toronto/ ''';

final String Podcasts = ''' 
Listening to podcasts can be a valuable tool for promoting wellness, offering a unique blend of entertainment, education, and relaxation. 
Whether exploring topics related to mental health, personal development, or mindfulness, podcasts provide a convenient and accessible way to absorb valuable information. 
Engaging with positive and uplifting content can inspire a sense of motivation and encourage individuals to adopt healthier habits. 
Furthermore, the auditory nature of podcasts allows for multitasking, making it easy to integrate them into daily routines, such as during workouts, commutes, or moments of relaxation. 
By fostering intellectual stimulation and emotional well-being, podcasts contribute to a more balanced and fulfilling life.

Find a podcast: https://open.spotify.com/genre/0JQ5DAqbMKFLb2EqgLtpjC
''';

final String Calumet = '''
Located in Calumet College Room: 129, students have an opportunity to recharge and refresh. 
Students may come by relax, study, play games, have some free coffee or tea, engage in wellness activities, and ask any questions related to health and wellness.

For more information: https://www.yorku.ca/colleges/ccsc/wellness-lounge/ ''';

final String Walk = ''' 
Taking leisurely walks around York University can be a simple yet effective way to promote wellness. 
The physical activity of walking contributes to cardiovascular health, improves mood by releasing endorphins, and helps reduce stress. 
The campus's green spaces and open areas offer a refreshing break, providing an opportunity for relaxation and mental rejuvenation. 
Additionally, walking between classes or around campus facilitates a sense of connection with the university community, fostering a positive and active lifestyle that contributes to overall well-being.
''';

final String Yoga= '''
Practicing yoga is a powerful means of promoting wellness, addressing both physical and mental aspects of health. 
The combination of controlled movements, breathwork, and mindfulness in yoga enhances flexibility, strength, and balance. 
This physical aspect is complemented by its profound impact on mental well-being, as yoga encourages relaxation, stress reduction, and improved focus. 
The practice also promotes self-awareness and mindfulness, fostering a holistic approach to wellness. 
Regular engagement in yoga can contribute to a sense of calm, increased energy levels, and an overall enhanced quality of life.
 ''';

final String Sports = '''
Participating in sports and intramurals is a dynamic way to promote wellness, offering a range of physical, mental, and social benefits. 
Engaging in sports activities enhances cardiovascular health, boosts overall fitness, and supports weight management. 
The teamwork and camaraderie inherent in sports foster social connections, contributing to a sense of belonging and community. 
Moreover, the competitive yet enjoyable nature of intramurals provides a platform for stress relief, improved mood, and enhanced mental well-being. 
Through regular participation, individuals can establish a balanced and active lifestyle, reaping the holistic rewards that sports and intramurals bring to overall wellness.

For more information: https://reconline.yorkulions.ca/program?classificationId=b1ea822b-bf9d-4e32-b069-a92789260aa4


 ''';