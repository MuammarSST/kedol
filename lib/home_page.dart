import 'package:flutter/material.dart';
import 'package:kedol/barang_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:kedol/barang_provider.dart';

class home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Keudee Online'),
      ),

      //fitur digunakan untuk refresh tarik kebawah
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<BarangProvider>(context, listen: false).getBarang(),
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.all(10),
          //ketika page ini di akses maka meminta data ke api
          child: FutureBuilder(
            future:
                Provider.of<BarangProvider>(context, listen: false).getBarang(),
            builder: (context, snapshot) {
              //jika proses request masih berlangsung

              if (snapshot.connectionState == ConnectionState.waiting) {
                //maka kita tampilkan indikator loading
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              //setelah itu kita render datanya
              return Consumer<BarangProvider>(
                builder: (context, data, _) {
                  //kemudian looping datanya dengan listbuilder
                  return ListView.builder(
                    itemCount: data.dataBarang.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 8,
                        child: ListTile(
                          title: Text(
                            data.dataBarang[i].nama,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Stock=${data.dataBarang[i].stok}'),
                          trailing: Text("\$${data.dataBarang[i].status}"),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
