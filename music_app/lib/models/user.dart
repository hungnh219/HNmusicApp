import 'package:music_app/models/song.dart';

class User {
  late final String email;
  late final String password;
  late final List<Song> favorites;

  User({
    required this.email,
    required this.password,
    required this.favorites
  });
}
List<Song> use1_song = <Song>[anh_dech_can_gi_nhieu_ngoai_em,
                              bai_nay_chill_phet,
                              lam_gi_phai_hot,
                              mot_trieu_like,
                              muoi_nam
                            ];
User user1=User(
  email: "1",
  password: "1",
  favorites: use1_song
);
List<Song> user2_song = <Song>[may_dang_giau_cai_gi_do,
                              suyt_nua_thi,
                              gio_van_hat,
                              hom_nay_toi_buon
                            ];

User user2=User(
  email: "nhan123@gmail.com",
  password: "nhan123",
  favorites: user2_song
);

List<User> userlist=[user1,user2];
