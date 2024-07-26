import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/provider/favourite_prodiver.dart';

class MyfavoriteItemScreen extends StatefulWidget {
  const MyfavoriteItemScreen({super.key});

  @override
  State<MyfavoriteItemScreen> createState() => _MyfavoriteItemScreenState();
}

class _MyfavoriteItemScreenState extends State<MyfavoriteItemScreen> {
 @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyfavoriteItemScreen()));
            },
            child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.yellow[200],
        centerTitle: true,
        title: Text('Fav app'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(builder: (context, value, child){
                    return ListTile(
                    onTap: (){
                      if(value.selectedItem.contains(index)){
                        value.removeItem(index);
                      }
                      else{
                        value.addItem(index);
                      }
                      
                    },
                    
                    title: Text('Item ' + index.toString()),
                    
                    trailing: Icon(
                     value.selectedItem.contains(index)? Icons.favorite :Icons.favorite_border_outlined ),
                  );
                  });
                }),
          )
        ],
      ),
    );
  }
}