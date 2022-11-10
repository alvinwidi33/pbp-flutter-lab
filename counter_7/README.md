Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
--> StatelessWidget adalah class widget yang propertinya immutable, artinya nilainya tidak bisa diubah. widget apa pun yang mengubah statusnya selama masa pakainya.

Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
--> AppBar : sebagai memuat title dalam halaman
--> Scaffold :sebagai fondasi halaman
--> FloatingActionButton: membuat button secara fungsional dalam page

Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
-->Apabila suatu kondisi terpenuhi, maka setState

Jelaskan perbedaan antara const dengan final.
--> const meminta nilai sebelum dicompile, tetapi final tidak meminta nilai
Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat app baru bernama counter_7 dengan create
2. Kemudian kita buat namanya menjadi Program Counter ```home: const MyHomePage(title: 'Program Counter'),```
3. Membuat fungsi baru bernama _decrementCounter dan buat menjadi code berikut
```void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }
```
4. Kita buat kondisi dimana jika bilangannya genap maka merah, jika ganjil maka biru
```if(_counter%2==0)...[
      Text("GENAP",style:TextStyle(color:Colors.red)),
    ]else...[
      Text("GANJIL",style:TextStyle(color:Colors.blue))
    ],
    Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    ),
```
5. Kita buat tombol untuk decrementnya dengan code berikut
``` floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                    child: FloatingActionButton(
                      onPressed: _decrementCounter,
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    )),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ))
```
