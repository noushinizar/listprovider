import 'package:flutter/material.dart';
import 'package:listprovider/provider/MovieProvider.dart';
import 'package:provider/provider.dart';
class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    var _myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title:Text("MyList (${_myList.length})") ,
      ),
      body: ListView.builder(
          itemCount: _myList.length,
          itemBuilder: (_,index){
            final currentMovie = _myList[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 4,
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.runtime ?? ''),
                trailing: TextButton(
                  child: const Text('Remove',
                  style:TextStyle( color:Colors.red )),
                  onPressed: (){
                    context.read<MovieProvider>().removeFromList(currentMovie);
                  },
                ),
              ),
            );
          }),
    );
  }
}
