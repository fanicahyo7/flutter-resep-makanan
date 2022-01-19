import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/services/sql_service.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Map<String, dynamic>> _resepFavoriteList = [];

  void _refreshResepFavorite() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _resepFavoriteList = data;
    });
  }

  @override
  void initState() {
    super.initState();

    // _addItem();

    _refreshResepFavorite();
  }

  // Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem('aaa', 'dsfdg', 'sdfg', 'fggsdf', 'dgsdg');
    _refreshResepFavorite();
  }

  // // Update an existing journal
  // Future<void> _updateItem(int id) async {
  //   await SQLHelper.updateItem(
  //       id, _titleController.text, _descriptionController.text);
  //   _refreshJournals();
  // }

  // Delete an item
  // void _deleteItem(int id) async {
  //   await SQLHelper.deleteItem(id);
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text('Successfully deleted a journal!'),
  //   ));
  //   _refreshJournals();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _resepFavoriteList.length,
          itemBuilder: (context, index) =>
              Text(_resepFavoriteList[index]['title']),
        ),
      ),
    );
  }
}
