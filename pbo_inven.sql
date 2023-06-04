create database pbo_inven;

use pbo_inven;

create table MANAJEMEN
(
   ID_BARANG          int not null AUTO_INCREMENT,
   KODE_BARANG        varchar(255),
   NAMA_BARANG        varchar(255),
   HARGA_BARANG    	  varchar(255),
   STOK_BARANG        varchar(255),
   primary key (ID_BARANG)
);


create table PENJUALAN
(
   ID_BARANG           int not null AUTO_INCREMENT,
   NAMA_BARANG 	       varchar(255),
   HARGA_BARANG        decimal,
   KETERANGAN_PRODUK   varchar(512),
   primary key (ID_BARANG)
);

create table TRANSAKSI
(
   ID_TRANSAKSI         int not null AUTO_INCREMENT,
   ID_USER              int,
   TANGGAL_TRANSAKSI    datetime not null,
   primary key (ID_TRANSAKSI)
);

create table TRANSAKSI_ITEM
(
   ID                   int not null AUTO_INCREMENT,
   ID_TRANSAKSI         int,
   ID_BARANG            int,
   JUMLAH               decimal,
   HARGA                numeric(8,0),
   primary key (ID)
);

CREATE TABLE USER
(
   ID_USER              INT NOT NULL AUTO_INCREMENT,
   NAMA_USER            VARCHAR(255),
   USERNAME_USER        VARCHAR(255),
   PASSWORD_USER        VARCHAR(255),
   PRIMARY KEY (ID_USER)
);

CREATE TABLE PELANGGAN
(
	id_pelanggan		INT(15) NOT NULL,
    nama_pelanggan		VARCHAR(100),
    jk_pelanggan		VARCHAR(20),
    noTelp_pelanggan	VARCHAR(25),
    alamat_pelanggan	TEXT,
    PRIMARY KEY(id_pelanggan)
);