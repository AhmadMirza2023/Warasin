class KonselorModel {
  final int id;
  final String nama;
  final String email;
  final String foto;
  final String rumahSakit;
  final String deskripsi;
  final int lamaKerja;
  final double ratingStar;
  final DateTime createdAt;
  final DateTime deletedAt;

  KonselorModel({
    required this.id,
    required this.foto,
    required this.rumahSakit,
    required this.nama,
    required this.email,
    required this.deskripsi,
    required this.lamaKerja,
    this.ratingStar = 0.0,
    required this.createdAt,
    required this.deletedAt,
  });

  factory KonselorModel.fromJson(Map<String, dynamic> json) {
    return KonselorModel(
      id: json['id'] ?? 0,
      foto: json['foto'] ?? '',
      rumahSakit: json['rumah_sakit'] ?? '',
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      lamaKerja: json['lama_kerja'] ?? 0,
      ratingStar: (json['rating'] ?? 0).toDouble(),
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'foto': foto,
      'rumah_sakit': rumahSakit,
      'nama': nama,
      'email': email,
      'deskripsi': deskripsi,
      'lama_kerja': lamaKerja,
      'rating': ratingStar,
      'created_at': createdAt,
      'deleted_at': deletedAt,
    };
  }
}
