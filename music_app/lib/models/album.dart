import 'package:music_app/models/song.dart';

// them loai de phan biet album
// kieu array
// types = [recently play, liked,...]
class album {
  late final String albumName;
  late final String albumImage;
  late final List<Song> songs;

  album({
    required this.albumName,
    required this.albumImage,
    required this.songs
  });
}

List<Song> den_vau_list = <Song>[anh_dech_can_gi_nhieu_ngoai_em,
                                 bai_nay_chill_phet,
                                 lam_gi_phai_hot,
                                 loi_nho,
                                 may_dang_giau_cai_gi_do,
                                 mot_trieu_like,
                                 muoi_nam
                                ];
album den_vau_album = album(
  albumName: 'Đen Vâu',
  albumImage: den_vau_list[0].image,
  songs: den_vau_list 
);

List<Song> random_list = <Song>[o_quy,
                                suyt_nua_thi,
                                gio_van_hat,
                                hom_nay_toi_buon,
                               ];
album random_album = album(
  albumName: 'Random',
  albumImage: random_list[0].image,
  songs: random_list 
);