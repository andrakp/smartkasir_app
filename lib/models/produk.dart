// Blueprint / Struktur Data (Model) untuk merepresentasikan entitas barang dagangan kasir
class Produk {
  //--- DEKLARASI VARIABEL ATRIBUT MODEL (PROPERTIES)
  final int id; // Identitas unik produk (Primary Key)
  final String nama; // Nama barang dagangan
  final String kategori; // Kategori: Makanan/Minuman/Snack
  final double harga; // Harga jual satuan dalam Rupiah
  final int stok; // Sisa jumlah persediaan unit barang
  final String gambarUrl; // Tautan foto produk dari internet
  final int diskonPersen; // Nilai promo potongan harga dalam persen

  // Konstruktor konstan dengan parameter wajib (required) dan nilai default
  const Produk({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.stok,
    required this.gambarUrl,
    this.diskonPersen = 0, // Default 0 jika tidak ada promo
  });
}

// DEKLARASI VARIABEL LIST KOLEKSI DATA DUMMY PRODUK
final List<Produk> daftarProdukDummy = [
  const Produk(
    id: 1,
    nama: 'Kopi Susu Gula Aren 250ml',
    kategori: 'Minuman',
    harga: 18000,
    stok: 24, // Persediaan aman (> 5) -> Badge hijau
    gambarUrl: 'https://images.unsplash.com/photo-1517256064527-09c73fc73e38?w=300',
    diskonPersen: 20, // Tambahkan baris ini
  ),
  const Produk(
    id: 2,
    nama: 'Roti Bakar Cokelat Keju',
    kategori: 'Makanan',
    harga: 15000,
    stok: 5, // Persediaan menipis (<= 5) -> Badge kuning
    gambarUrl: 'https://images.unsplash.com/photo-1584776296944-ab6fb57b0bdd?w=300',
  ),
  const Produk(
    id: 3,
    nama: 'Matcha Latte Ice',
    kategori: 'Minuman',
    harga: 22000,
    stok: 0, // Habis (== 0) -> Badge merah & tombol nonaktif
    gambarUrl: 'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=300',
  ),
  const Produk(
    id: 4,
    nama: 'Nasi Goreng Banjar Spesial',
    kategori: 'Makanan',
    harga: 25000,
    stok: 12, // Persediaan aman
    gambarUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=300',
    diskonPersen: 10, // Menampilkan badge promo 10%
  ),
  const Produk(
    id: 5,
    nama: 'Kentang Goreng Crispy',
    kategori: 'Snack',
    harga: 12000,
    stok: 18,
    gambarUrl: 'https://images.unsplash.com/photo-1576107232684-1279f3908594?w=300',
  ),
  const Produk(
    id: 6,
    nama: 'Air Mineral Botol 600ml',
    kategori: 'Minuman',
    harga: 5000,
    stok: 40,
    gambarUrl: 'https://images.unsplash.com/photo-1559839914-1b346d61081a?w=300',
  ),
];