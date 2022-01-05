class Resep {
  final int id;
  final String judul;
  final String deskripsi;
  final String urlGambar;
  final List<String> bahan;
  final List<String> bumbuhalus;
  final List<String> caramembuat;

  Resep(
      {required this.id,
      required this.judul,
      required this.deskripsi,
      required this.urlGambar,
      required this.bahan,
      required this.bumbuhalus,
      required this.caramembuat});
}

List<Resep> masterResep = [
  Resep(
      id: 1,
      judul: "Rendang paha ayam organik",
      deskripsi: "Makanan enak",
      urlGambar:
          "https://cdn-brilio-net.akamaized.net/news/2019/07/23/167723/1069955-1000xauto-resep-masakan-sederhana-menu-sehari-hari.jpg",
      bahan: [
        "4 paha ayam organik",
        "2 buah kentang potong-potong",
        "2 butir telur rebus",
        "1 lembar daun kunyit iris",
        "4 lembar daun jeruk",
        "2 lembar daun salam",
        "1 bungkus kerisik (kelapa parut kering)",
        "200 ml santan + air",
        "Garam, perasan dan gula malaka",
      ],
      bumbuhalus: [
        "8 butir bawang merah",
        "3 butir bawang putih",
        "1 cm kunyit",
        "1 cm jahe",
        "1 cm lengkuas",
        "2 batang serai",
        "3 buah cabai rawit",
        "3 buah cabai merah",
      ],
      caramembuat: [
        "Goreng kentang sisihkan.",
        "Panaskan minyak tumis bahan halus sampai kering dan pecah minyak.",
        "Masukkan ayam tumis sebentar kemudian masukkan santan dengan air aduk rata.",
        "Masukkan kerisik, daun jeruk, daun salam, dan daun kunyit.",
        "Kemudian masukkan kentang dan telur rebus tambahkan garam, gula malaka dan perasa.",
        "Masak dengan api kecil sampai air kering, jika ingin berkuah jangan masak sampai kering.",
      ]),
  Resep(
      id: 2,
      judul: "Gulai ayam",
      deskripsi: "ini makanan enak juga",
      urlGambar:
          "https://cdn-brilio-net.akamaized.net/news/2019/07/23/167723/1069954-1000xauto-resep-masakan-sederhana-menu-sehari-hari.jpg",
      bahan: [
        "1/2 ekor ayam",
        "1 buah jeruk nipis",
        "1 batang serai geprek",
        "2 lembar daun salam",
        "2 lembar daun jeruk",
        "200 ml santan encer",
        "200 ml santan kental",
        "air matang secukupnya",
        "secukupnya garam dan kaldu bubuk",
      ],
      bumbuhalus: [
        "6 siung bawang merah",
        "3 siung Bawang Putih",
        "3 butir kemiri sangrai",
        "4 cm lengkuas muda",
        "3 cm kunyit",
        "3 cm jahe",
        "1 sdm ketumbar",
        "1 sdt lada bubuk",
        "5 buah cabai rawit",
        "10 cabai merah keriting",
      ],
      caramembuat: [
        "Cuci bersih daging ayam dan lumuri dengan jeruk nipis diamkan kurang lebih 10 menit",
        "Tumis bumbu halus sampai wangi, masukkan daun salam, daun jeruk, dan sereh, aduk sampai bumbu matang, masukkan ayam, aduk rata, masak sampai berubah warna, tambahkan garam dan kaldu",
        "Masukkan santan encer dan air, masak dengan api sedang sampai daging ayam empuk",
        "Setelah kuah menyusut dan daging ayam empuk, masukkan santan kental, masak sambil terus diaduk sampai santan mendidih dan bumbu meresap",
      ])
];
