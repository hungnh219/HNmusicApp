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
                                nhung_loi_hua_bo_quen,
                               ];
album random_album = album(
  albumName: 'Random',
  albumImage: random_list[0].image,
  songs: random_list 
);

List<Song> son_tung_list = <Song>[am_tham_ben_em,
                                  con_mua_ngang_qua,
                                  hay_trao_cho_anh,
                                  nang_am_xa_dan,
                                  nhu_ngay_hom_qua,
                                  thai_binh_mo_hoi_roi,
                                 ];
album son_tung_album = album(
  albumName: 'Sơn Tùng',
  albumImage: son_tung_list[0].image,
  songs: son_tung_list 
);

List<Song> wxrdie_list = <Song>[em_iu,
                                tetvoven,
                                vinflow,
                                youngz,
                               ];
album wxrdie_album = album(
  albumName: 'Wxrdie',
  albumImage: wxrdie_list[0].image,
  songs: wxrdie_list 
);

List<Song> bich_phuong_list = <Song>[bao_gio_lay_chong,
                                     bua_yeu,
                                     di_du_dua_di,
                                     em_bo_thuoc_chua,
                                     gui_anh_xa_nho,
                                    ];
album bich_phuong_album = album(
  albumName: 'Bích Phương',
  albumImage: bich_phuong_list[0].image,
  songs: bich_phuong_list 
);

List<Song> mck_list = <Song>[buon_hay_vui,
                             chi_mot_dem_nua_thoi,
                             chim_sau,
                             choi_do,
                             iceman,
                             phong_cach,
                             stupid_rich_man,
                            ];
album mck_album = album(
  albumName: 'MCK',
  albumImage: mck_list[0].image,
  songs: mck_list 
);