import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(
      {super.key,
      required this.title,
      this.name = "john doe",
      this.age = "30"});

  final String title;
  final String name;
  final String age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 100,
        centerTitle: true,
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 50),
              child: Icon(
                Icons.account_circle,
              )),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSACh7BHy3KIjQlJQkxMx55mjxIW5tEKIeRMQ&s")),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        " $name \n $age years old",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Photos",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: GridView.count(
                            shrinkWrap:
                                true, // because grideview and list view are both scrollable
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 8,
                            children: [
                              Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSACh7BHy3KIjQlJQkxMx55mjxIW5tEKIeRMQ&s"),
                              Image.network(
                                  "https://images.unsplash.com/photo-1480455624313-e29b44bbfde1?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z3V5fGVufDB8fDB8fHww"),
                              Image.network(
                                  "https://www.shutterstock.com/image-photo/photo-handsome-happy-young-caucasian-260nw-1115156849.jpg"),
                              Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN6Z5fsxwmKCixCZiS1rkUE55tBKpjBBMpyA&s"),
                              Image.network(
                                  "https://images.unsplash.com/photo-1480455624313-e29b44bbfde1?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z3V5fGVufDB8fDB8fHww"),
                              Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSACh7BHy3KIjQlJQkxMx55mjxIW5tEKIeRMQ&s"),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(4, 6))),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent.shade100,
                                    borderRadius: const BorderRadius.all(
                                        Radius.elliptical(4, 6))),
                              )
                            ],
                          ),
                        ),
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
}
