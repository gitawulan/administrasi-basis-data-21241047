

 -- soal no 1 
 -- munculkanlah kode pelanggan, nama produk, kuantitynya, harga dan total harga dari semua produk yang pernah di transaksikan, namun output yang di minta adalah total harga minimal  200.000 dan urutkan berdasarkan dengan total hargany 
select * from (select kode_pelanggan, nama_produk, qty, harga, qty*(harga-(harga*diskon_persen/100)) as total from dqlabpraktik3.tr_penjualan_dqlab) as t where total>=200000 order by total;

-- soal no2
-- munculkan kode transaksi, kode pelanggan, nama pelanggan , kode produk, nama produk, harga, kuantitynya, dan total yang kuantitynya di atas 3 dan di urutkan berdasarkan total
 select * from (select p.kode_transaksi, p.kode_pelanggan, pl.nama_pelanggan, p.kode_produk, p.nama_produk, p.harga, p.qty, p.qty*(p.harga-(p.harga*p.diskon_persen/100)) as total from dqlabpraktik3.tr_penjualan_dqlab as p inner join dqlabpraktik3.ms_pelanggan_dqlab as pl on p.kode_pelanggan=pl.kode_pelanggan) as t where qty>3 order by total;
 
 -- soal 3 
-- munculkan nama produk, tgl transaksi, bulan, tahun, selisih hari dari transaksi dengan tanggal 30 juni 2023 atas semua produk yang ada di historical database penjualan

 select * from (select nama_produk, tgl_transaksi, month(tgl_transaksi) as bulan, year(tgl_transaksi) as tahun, datediff(tgl_transaksi, '2023-06-23') as selisih_hari  from dqlabpraktik3.tr_penjualan_dqlab) as t;