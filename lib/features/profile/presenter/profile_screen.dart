import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {}),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 20,
                      spreadRadius: 10,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 105,
                        width: 105,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(52.5),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.yellow,
                                spreadRadius: 2,
                              )
                            ]),
                        child: const Image(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '@selenagomez',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 35),
                    child: Text(
                      'Selena Gomez',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(6),
                      color: Colors.blue.withOpacity(0.1),
                      child: const Text('Email: ' 'EMiLAL')),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(6),
                      color: Colors.blue.withOpacity(0.1),
                      child: const Text('ID: ' '1234567')),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                color: Colors.blue.withOpacity(0.1),
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Log out',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
