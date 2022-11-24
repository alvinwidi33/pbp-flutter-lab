import 'package:counter_7/mypage/detail.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/func/fetch.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'My Watch List',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.black54,
            ),
          ),
        ),
        drawer: buildDrawer(context),
        body: FutureBuilder(
            future: fetchMyWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: snapshot.data![index].fields.watched
                                ?Color.fromARGB(255, 71, 203, 205)
                                :Color.fromARGB(255, 30, 44, 99),
                          )
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WatchListDetailPage(
                                  title:
                                  futureWatchList[index].fields.title,
                                  watched:
                                  futureWatchList[index].fields.watched,
                                  rating:
                                  futureWatchList[index].fields.rating,
                                  releasedDate: futureWatchList[index]
                                      .fields
                                      .releaseDate
                                      .toString(),
                                  review:
                                  futureWatchList[index].fields.review,
                                ))),
                        child: Row(
                          children: [
                            Text(
                              "${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 26, 19, 19),
                              ),
                            ),
                            SizedBox(
                              width: 100.0,
                            ),
                            Checkbox(
                                checkColor: Colors.white,
                                activeColor: Color.fromARGB(255, 255, 149, 0),
                                value: futureWatchList[index].fields.watched,
                                onChanged: (bool? value) {
                                  setState(() {
                                    futureWatchList[index].fields.watched =
                                    value!;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}