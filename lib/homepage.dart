import 'package:flutter/material.dart';
import 'package:listprovider/MyList.dart';
import 'package:listprovider/provider/MovieProvider.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> const MyList()),
              );
            },
        icon: const Icon(Icons.favorite),
            label: Text("Go To Mylist(${myList.length})",
        style: const TextStyle(fontSize: 24),
            ),
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 20)),
        ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: movies.length ,
                  itemBuilder: (_,index){
                    final currentMovie = movies[index];
                    return Card(
                      key:ValueKey(currentMovie.title),
                      color:Colors.pinkAccent,
                      elevation:4,
                      child: ListTile(
                        title: Text(currentMovie.title),
                        subtitle: Text(currentMovie.runtime ?? 'No Information'),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: myList.contains(currentMovie)
                                  ?Colors.green
                                  :Colors.white,
                            size: 30,
                          ),
                          onPressed: (){
                            if(!myList.contains(currentMovie)){
                              context.read<MovieProvider>().addToList(currentMovie);
                            }else{
                              context.read<MovieProvider>().removeFromList(currentMovie);
                            }
                          },
                        ),
                      )
                    );
                  },

                ))
          ],
        ),
      ),
    );
  }
}
