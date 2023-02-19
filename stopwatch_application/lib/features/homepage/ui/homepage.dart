import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class MyTimerHomePage extends StatefulWidget {
  const MyTimerHomePage({super.key});

  @override
  State<MyTimerHomePage> createState() => _MyTimerHomePageState();
}

class _MyTimerHomePageState extends State<MyTimerHomePage> {
  //Deklarasi variabel utama untuk inisialisasi timer.
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  //Deklarasi tipe class 'Timer' kedalam variabel 'timer', class 'Timer' berasal dari library 'dart:async'.
  Timer? timer;
  bool started = false;
  //Deklarasi List untuk menyimpan flag yang akan disimpan saat perhitungan timer.
  List laps = List.empty(growable: true);
  //Deklarasi fungsi untuk menghentikan perhitungan timer.
  void stop(){
    timer!.cancel();
    setState(() {
      started = false;
    });
  }
  //Deklarasi fungsi untuk mereset perhitungan timer.
  void reset(){
    timer!.cancel();
    setState(() {
      //Set seluruh variabel menjadi 0.
      seconds = 0;
      minutes = 0;
      hours = 0;
      //Set seluruh tampilan pada layar menjadi "00".
      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";
      started = false;
    }); 
  }
  //Deklarasi fungsi untuk menghapus perhitungan timer yang disimpan di List.
  void resetLaps(){
    //Deklarasi untuk menghapus seluruh data didalam List.
    laps.clear();
  }
  //Deklarasi fungsi untuk menyimpan perhitungan timer.
  void addLaps(){
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }
  //Deklarasi fungsi untuk memulai perhitungan timer.
  void start(){
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //Deklarasi variabel local periodik dari variabel timer utama yang sudah dideklarasikan.
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;
      //Percabangan kondisi perhitungan timer.
      //Saat 'localSeconds' > 59 dan 'localMinutes' > 59 maka 'localHours' akan increment dan 'localMinutes' menjadi 0.
      //Saat 'localSeconds' > 59 dan 'localMinutes' < 59 maka 'localHours' tidak increment, sehingga 'localMinutes' akan increment dan 'localSeconds' menjadi 0.
      if(localSeconds > 59){
        if(localMinutes > 59){
          localHours++;
          localMinutes = 0;
        }else{
          localMinutes++;
          localSeconds = 0;
        }
      }
      //Set perubahan perhitungan timer periodik kedalam variabel timer utama.
      setState(() {
        //Inisialisasi kedalam variabel timer utama.
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        //Konfigurasi tampilan timer saat kondisi satuan dan puluhan.
        digitSeconds = (seconds >= 10) ? "$seconds":"0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes":"0$minutes";
        digitHours = (hours >= 10) ? "$hours":"0$hours";
      });
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Deklarasi nama 'Stopwatch' sebagai nama aplikasi di layar utama.
              Center(
                child: Text(
                  "Stopwatch",
                  style: GoogleFonts.aladin(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              //Deklarasi invisible widget sebagai layouting widget.
              const SizedBox(
                height: 20,
              ),
              //Deklarasi widget untuk menampilkan perhitungan di layar utama.
              Center(
                child: Text(
                  "$digitHours:$digitMinutes:$digitSeconds",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 82,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              //Deklarasi widget sebagai tempat untuk menyimpan perhitungan timer.
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                //Deklarasi builder untuk menampilkan tulisan dari perhitungan timer yang disimpan.
                child: ListView.builder(
                  itemCount: laps.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Deklarasi yang menampilkan urutan flag yang disimpan.
                          Text(
                            "${index +1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16
                              ),
                            ),
                            //Deklarasi yang menampilkan perhitungan timer yang disimpan.
                            Text(
                            "${laps[index]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16
                              ),
                            )
                        ]),);
                  }),
              ),
              //Deklarasi invisible widget sebagai layouting widget.
              const SizedBox(height: 20),
              //Deklarasi widget untuk menyimpan 'start'/'stop', 'flag', dan 'reset' buttor.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Deklarasi widget 'start'/'stop' button.
                  Expanded(
                    child: RawMaterialButton(
                      fillColor: Colors.green,
                      onPressed: (){
                        //Percabangan fungsi 'start()' dan 'stop()'.
                        // Saat tombol ditekan 'start', fungsi start() akan berjalan.
                        // Saat tombol ditekan 'stop', fungsi 'stop()' akan berjalan.
                        (!started) ? start() : stop();
                      },
                      shape:  const StadiumBorder(
                        side: BorderSide(color: Colors.white),
                      ),
                      child: Text(
                        //Percabangan text 'Start' dan 'Stop'.
                        // Saat tombol ditekan 'Start', text 'Stop' akan tampil di button.
                        // Saat tombol ditekan 'Stop', text 'Start' akan tampil di button.
                        (!started) ? "Start" : "Stop",
                        style: GoogleFonts.aladin(
                          color: Colors.white,
                          fontSize: 20
                        ),
                          ),
                      ) 
                  ),
                  //Deklarasi invisible widget sebagai layouting widget.
                  const SizedBox(height: 8),
                  //Deklarasi widget 'flag' button.
                  IconButton(
                    onPressed: () {
                      //Saat 'Flag' ditekan, fungsi 'addLaps' akan berjalan untuk menyimpan perhitungan timer.
                      addLaps();
                    }, 
                    icon: const Icon(
                      Icons.flag,
                      color: Colors.white),
                  ),
                  //Deklarasi invisible widget sebagai layouting widget.
                  const SizedBox(height: 8),
                  //Deklarasi widget 'reset' button.
                  Expanded(
                    child: RawMaterialButton(
                      fillColor: Colors.red,
                      onPressed: (){
                        //Saat 'Reset' button ditekan, akan menjalankan fungsi 'reset()' dan 'resetLaps()' untuk mereset timer.
                        reset();
                        resetLaps();
                      },
                      shape:  const StadiumBorder(
                        side: BorderSide(color: Colors.white),
                      ),
                      child: Text(
                        "Reset",
                        style: GoogleFonts.aladin(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                          ),
                      ) 
                  ),
                ],)
            ]),)),
    );
  }
}