class UserModel {
  final int id;
  final String nama;
  final String email;
  final String foto;
  final String tanggalLahir;

  UserModel({
    required this.id,
    required this.foto,
    required this.tanggalLahir,
    required this.nama,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['data']['id'] ?? 0,
      foto: json['data']['foto'] ?? '',
      tanggalLahir: json['data']['tgl_lahir'],
      nama: json['data']['nama'],
      email: json['data']['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'foto': foto,
      'tgl_lahir': tanggalLahir,
      'nama': nama,
      'email': email,
    };
  }
}
