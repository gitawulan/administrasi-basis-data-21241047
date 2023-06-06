-- ORDER BY,GROUP BY, ASC DESC, HAVING

-- menggunakan database dqlabmartbasic
use dqlabpraktik3;

-- menggunakan 0RDER BY untuk mengurutkan data
-- ambil kolom nama_produk, qty pada tabel penjualan, dan diurutkan berdasarkan kolom qty
select nama_produk, qty
from tr_penjualan_dqlab
order by qty;

-- ambil kolom dan nama produk tabel penjualan dan urutkan berdasarkan qty dan nama_produk
select nama_produk, qty
from tr_penjualan_dqlab
order by qty, nama_produk;

-- ambil semua kolom dari table tr_penjualan_dqlab dengan mengurutkan berdasarkan qty dan tgl_transaksi
select* from tr_penjualan_dqlab order by qty, tgl_transaksi;

-- ambil semua kolom dari table ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan
select* from ms_pelanggan_dqlab order by nama_pelanggan;

-- tampilkan semua kolom dari table ms_pelanggan dengan mengurutkan berdasarakan alamat
select* from ms_pelanggan_dqlab order by alamat;

-- ORDER BY DENGAN ASC DAN desc
-- ambil nama_produk, qty dari tabel penjualan urutkan dengan DESC qty
select nama_produk,qty
from tr_penjualan_dqlab
order by qty DESC;

-- Ambil nama_produk, qty dari tabel penjualan urutkan qty DESC qty dan nama_produk asc
select nama_produk, qty from tr_penjualan_dqlab order by qty desc, nama_produk asc;

-- latihan 2
-- tampilkan semua kolom dari table tr_penjualan_dqlab dengan mengurutkan berdasarkan tgl_transaksi secara desc dan qty secara asc
select* from tr_penjualan_dqlab order by tgl_transaksi desc, qty asc;

-- tampilkan semua kolom dari table ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan secara desc
select* from ms_pelanggan_dqlab order by nama_pelanggan desc;

-- tampilkan semua kolom dari table ms_pelanggan dengan mengurutkan berdasrkan alamat secara desc
select* from ms_pelanggan_dqlab order by alamat desc;

-- latihan 3
-- ORDER BY dari hasil perhitungan 
-- ambil nama_produk, qty, harga, total_beli, urutkan berdasarkan total beli
select nama_produk, qty, harga, qty*harga as total_beli
from tr_penjualan_dqlab order by total_beli desc;

-- cobalah pengurutan dengan ekspresi total harga menggunakan rumusan jumblah barang dikali harga barang dikurangi diskon
select 250000 - (250000*(10/100));

-- atihan4
 -- ORDER BY dengan where
 -- ambil nama_produk, qty dari tabel penjualan dengan nama_produk berawalan F, urutkan berdasarkan  qty terbanyak
 select nama_produk, qty from tr_penjualan_dqlab where nama_produk like 'F%' order by qty desc;
 
 select diskon_persen from tr_penjualan_dqlab
 where diskon > 0;
 
 -- tampilkan semua kolom dari transasksi penjualan yang memiliki diskon dan urutkan berdasarkan harga tertinggi
 select* from tr_penjualan_dqlab where diskon_persen > 0 order by harga desc;
 
 
 -- tampilkan kolom nama produk, kuantitas  pembelian dan harga dari transaksi penjualan yang memiliki harga minimal seratus ribu rupiah dan di urutkan berdasarkan harga tertinggi
 select nama_produk, qty, harga from tr_penjualan_dqlab where harga >= 100000 order by harga desc;
 
 -- tampilkan kolom nama_produk, kuantitas pembelian dan harga dari transaksi penjualan yang memiliki harga minimal seratus ribu rupiah atau nama produk berawalan karakter 'T' dan di urutkan  berdasarkan diskon tertnggi
 select nama_produk, qty, harga from tr_penjualan_dqlab where harga >= 100000 or nama_produk like 'T%' order by diskon_persen desc;

-- fungsi agregasi
-- ambil hasil perhitungan dari nilai qty dari seluruh row paa tabel transaksi
select sum(qty) from tr_penjualan_dqlab;
 -- menghitung jumlah seluruh row  pada tabel transaksi
 select count(*) from tr_penjualan_dqlab;
 select count(*) from ms_pelanggan_dqlab;
 select count(*) from ms_produk_dqlab;
 
 -- menghitung penjualan qty dan menghitung seluruh row
 select sum(qty) , count(*) from tr_penjualan_dqlab;
 
 -- menghitung rata2 qty, nilai tertinggi qty, dan nilai terendah qty
 select avg(qty), max(qty) from tr_penjualan_dqlab;
 
 -- menghitung nilai unik dari nama_produk di tabel tr_penjualan_dqlab
 select count(distinct nama_produk), count(nama_produk) from tr_penjualan_dqlab;
 
 -- menarik field nama produk dan fungsi agregasi untuk nilai qty  pada tabel tr_penjualan_dqlab
 select nama_produk, max(qty) from tr_penjualan_dqlab;
 
 -- GROUP BY
 -- mengambil grouping nilai dari kolom nama_produk
 select nama_produk from tr_penjualan_dqlab group by nama_produk;
 
 -- mengambil grouping nilai dari kolom nama produk dan qty 
 select nama_produk dan, qty from tr_penjualan_dqlab group by nama_produk, qty;
 
 -- ambil jumlah qty dari grouping nama_produk terhadap seluruh row pada pada tabel transaksi
 select nama_produk, sum(qty) from tr_penjualan_dqlab group by nama_produk;
 
 -- ambil jumlah qty dari hasil grouping nama_produk terhadap seluruh row tabael penjualan urutkan qty terbesar 
 select nama_produk, sum(qty) from tr_penjualan_dqlab group by nama_produk order by sum(qty) desc;
 
 -- HAVING
 -- ambil jumlah qty > 2 dari hasil grouping nama_produk  terhadap seleruh row pada tabel transksi
 select nama_produk, sum(qty) from tr_penjualan_dqlab group by nama_produk having sum(qty) > 2 order by sum(qty) desc;
 
 -- LATIHAN MANDIRI
 -- Melihat daftar nama-produk yang total jumlah produk terjual per kelompok nama_produk adalah di atas nilai 4
 select nama_produk, sum (qty) from tr_penjualan_dqlab group by nama_produk having sum(qty) > 4;
 
 -- melihat daftar produk yang total jumlah produk yang total jumlah produk terjual perkelompok nama produk  sama dengan 9
 select nama_produk, sum(qty) from tr_penjualan_dqlab group by nama_produk having sum(qty) = 9;
 -- menlihat daftar kelompok nama produk dan total nilai penjualan  (harga dikalikan jumlah dikurangi diskon) dengan dan urutan bedasarkan nilai penjualan terbesar
 select nama_produk, sum(qty*harga) from tr_penjualan_dqlab group by nama_produk order by sum(qty*harga) desc;
 
 
 
 
 
 
 
 
 
 
