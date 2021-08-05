import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

void main() {
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Example IntrinsicGirdView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     debugShowCheckedModeBanner: false,

     home: ExampleScreen(),
    );
  }
}


class ExampleScreen extends StatelessWidget {
  var size;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    List<ScientistModel> scientists = fetchScientists();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey.shade700,
        title: Text('IntrinsicGridView Example'),
      ),
      body: Container(
        color: Colors.blueGrey.shade900,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: IntrinsicGridView.vertical(
                        padding: EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
                        columnCount: 1,
                        verticalSpace: 10,
                        horizontalSpace: 10,
                        children: [
                          for (var scientist in scientists)
                            _buildWidget(scientist),
                        ]
                    ),
                  ),

                  Expanded(
                    child: IntrinsicGridView.vertical(
                        padding: EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
                        // columnCount: 3,
                        verticalSpace: 10,
                        horizontalSpace: 10,
                        children: [
                          for (var scientist in scientists)
                            _buildWidget(scientist),
                        ]
                    ),
                  ),


                ],
              ),
            ),

            Expanded(
              child: IntrinsicGridView.horizontal(
                  padding: EdgeInsets.only(top: 16, bottom: 12, left: 12, right: 12),
                  // rowCount: 1,
                  verticalSpace: 10,
                  horizontalSpace: 10,
                  children: [
                    for (var scientist in scientists)
                      _buildHorizontalWidget(scientist),
                  ]
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget _buildWidget(ScientistModel scientist){

    double radius = 5.0;

    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))
        ),
        elevation: 30,
        shadowColor: Colors.lightBlueAccent,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
              child: Image.network(
                "${scientist.image}",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4, left: 8, bottom: 8, top: 8),
              child: Text(
                scientist.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4, left: 8, bottom: 8),
              child: Text(
                scientist.desc,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget _buildHorizontalWidget(ScientistModel scientist){

    double radius = 5.0;

    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))
        ),
        elevation: 30,
        shadowColor: Colors.lightBlueAccent,
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
              ),
              child: Image.network(
                "${scientist.image}",
                fit: BoxFit.cover,
                width: 120,
                height: double.infinity,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4, left: 8, bottom: 4, top: 4),
                    child: Text(
                      scientist.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4, left: 8, bottom: 8),
                    child: Text(
                      scientist.desc,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        )
    );
  }

  List<ScientistModel> fetchScientists(){
    return <ScientistModel>[
      ScientistModel('Alain Aspect', 'https://res.cloudinary.com/highereducation/image/upload/w_120,h_160,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/alain-aspect.jpg', "Alain Aspect holds the Augustin Fresnel Chair at the Institut d'Optique."),
      ScientistModel('David Baltimore', 'https://res.cloudinary.com/highereducation/image/upload/w_125,h_175,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/david-baltimore.jpg', "David Baltimore is currently Professor of Biology at the California Institute of Technology."),
      ScientistModel('John Tyler Bonner', 'https://res.cloudinary.com/highereducation/image/upload/w_120,h_137,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/john-tyler-bonner.jpg', "John Tyler Bonner is one of the world's leading biologists, primarily known for his work in the use of cellular slime molds to understand evolution."),
      ScientistModel('Dennis Bray', 'https://res.cloudinary.com/highereducation/image/upload/w_130,h_170,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/dennis-bray.jpg', "Dennis Bray is a professor emeritus in the Department of Physiology, Development, and Neuroscience at the University of Cambridge."),
      ScientistModel('Sydney Brenner', 'https://res.cloudinary.com/highereducation/image/upload/w_130,h_170,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/sydney-brenner.jpg', "Sydney Brenner is a biologist and the winner of the 2002 Nobel Prize in Physiology or Medicine,"),
      ScientistModel('Pierre Chambon', 'https://res.cloudinary.com/highereducation/image/upload/w_160,h_160,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/pierre-chambon.jpg', "Pierre Chambon is professor at the University of Strasbourg's Institute for Advanced Study."),
      ScientistModel('Simon Conway Morris', 'https://res.cloudinary.com/highereducation/image/upload/w_130,h_170,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/simon-conway-morris.jpg', "Simon Conway Morris is Chair of Evolutionary Palaeobiology in the Earth Sciences Department at Cambridge University."),
      ScientistModel('Mildred S. Dresselhaus', 'https://res.cloudinary.com/highereducation/image/upload/w_160,h_160,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/mildred-dresselhouse.jpg', "Mildred S. Dresselhaus is a professor of physics and electrical engineering"),
      ScientistModel('Allen J. Bard', 'https://res.cloudinary.com/highereducation/image/upload/w_160,h_165,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/allan-j-bard.jpg', 'Allen J. Bard is a professor at the University of Texas, where he also serves as director of the Center for Electrochemistry and holds the Norman Hackerman-Welch Regents Chair. He received his Ph.D. from Harvard University in 1958.'),
      ScientistModel('Timothy Berners-Lee', 'https://res.cloudinary.com/highereducation/image/upload/w_130,h_175,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/timothy-berners-lee.jpg', 'Timothy Berners-Lee is a computer scientist, best known as the inventor of the World Wide Web. He was honored as the "Inventor of the World Wide Web" during the 2012 Summer Olympics opening ceremony.'),
      ScientistModel('Gerald M. Edelman', 'https://res.cloudinary.com/highereducation/image/upload/w_160,h_145,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/gerald-m-edelman1.jpg', "Gerald M. Edelman is a biologist, immunologist, and neuroscientist."),
      ScientistModel('Ronald M. Evans', 'https://res.cloudinary.com/highereducation/image/upload/w_130,h_180,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/ronald-m-evans.jpg', "Ronald M. Evans is the March of Dimes Chair in Molecular and Developmental Biology at the Salk Institute for Biological Studies in San Diego."),
      ScientistModel('Jane Goodall', 'https://res.cloudinary.com/highereducation/image/upload/w_130,h_170,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/jane-goodall.jpg', "Jane Goodall is a primatologist, ethologist, and anthropologist."),
      ScientistModel('Leroy Hood', 'https://res.cloudinary.com/highereducation/image/upload/w_140,h_160,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/leroy-hood.jpg', "Leroy Hood is co-founder and President of the Institute for Systems Biology.")
    ];

  }
}

class ScientistModel{
  String name;
  String image;
  String desc;
  ScientistModel(this.name, this.image, this.desc);
}