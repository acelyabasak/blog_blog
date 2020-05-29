-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 29 May 2020, 02:48:19
-- Sunucu sürümü: 10.4.11-MariaDB
-- PHP Sürümü: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(11) NOT NULL,
  `kategori_adi` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_aciklama` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori_adi`, `kategori_aciklama`) VALUES
(1, 'css', 'css dersleri'),
(2, 'html', 'html dersleri'),
(3, 'php', 'php dersleri'),
(4, 'java', 'java dersleri');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `konular`
--

CREATE TABLE `konular` (
  `konu_id` int(11) NOT NULL,
  `konu_baslik` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `konu_aciklama` text COLLATE utf8_turkish_ci NOT NULL,
  `konu_ekleyen` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `konu_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `konu_kategori` int(11) NOT NULL DEFAULT 0,
  `konu_durum` int(11) NOT NULL DEFAULT 0,
  `konu_hit` int(11) NOT NULL DEFAULT 0,
  `konu_resim` varchar(300) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `konular`
--

INSERT INTO `konular` (`konu_id`, `konu_baslik`, `konu_aciklama`, `konu_ekleyen`, `konu_tarih`, `konu_kategori`, `konu_durum`, `konu_hit`, `konu_resim`) VALUES
(1, 'php dersleri', 'Lorem Ipsum , baskı ve dizgi endüstrisinin kukla metnidir. Lorem Ipsum, bilinmeyen bir yazıcının tip bir kadırga alıp bir tür örnek kitap yapmak için karıştırdığı 1500\'lerden beri endüstrinin standart kukla metni olmuştur. Sadece beş yüzyıl boyunca hayatta kalmadı, aynı zamanda elektronik dizgiye sıçradı ve temelde değişmedi. 1960\'larda Lorem Ipsum pasajları içeren Letraset sayfalarının piyasaya sürülmesiyle ve daha yakın zamanda Lorem Ipsum\'un sürümlerini içeren Aldus PageMaker gibi masaüstü yayıncılık yazılımlarıyla popüler hale geldi.', 'acelya', '2020-05-24 13:44:48', 3, 1, 7, 'https://i.hizliresim.com/f2ke21.png'),
(2, 'css dersleri', 'Genel bir tanım olarak HTML aracılığı ile yapılamayacak oldukça fazla bir seçenek bu sistem bünyesinde yapılabilmektedir. Bunlar arasında bir sitenin her hangi bir sayfa içeriğinde arka plan resmi, renk ya da boyut olarak belli bir öğeyi veya sayfanın konumunu ve bunun gibi daha birçok değişik özelliği CSS yardımı ile tanımlamasını yapabilirsiniz. CSS dosyası sayesinde her sayfanın stili ayarlanabileceği için sayfaların kapladığı boyut küçülür ve gereğinden fazla olan yükü oldukça hafifler. Üstelik CSS formatı anlaşılması ve öğrenilme aşaması pek bir zorluk çektirmeyen bir dil yapısına sahiptir. Bu noktada CSS kullanılacak ise o zaman HTML bilgisine temel olarak mutlaka sahip olmanız gerekmektedir. CSS kod yazımı çoğu kodlama sisteminde olduğu gibi İngilizce kullanılmaktadır. Bu noktada kod yazılım içerisinde eklenecek olan İngilizce kelimeleri bilmek yeterli olacaktır.', 'Açelya', '2020-05-25 23:12:53', 1, 1, 4, 'https://i.hizliresim.com/Sl6462.png'),
(3, 'Html dersleri', 'WEB Siteleri yapabilmek için bir web sayfasının yapısını tanımlamak için gerekli olan HTML teknolojileri hakkında bilgi sahibi olmalısınız. HTML, web içeriğinizin bir paragraf, liste, başlık, bağlantı, resim, multimedya oynatıcı, form veya mevcut diğer birçok öğeden biri veya tanımladığınız yeni bir öğe olarak tanınması gerektiğini belirtmek için kullanılır.', 'acelya', '2020-05-25 23:15:29', 2, 1, 9, 'https://g.hizliresim.com/yatay-ve-dikey'),
(6, 'Admin panelinden deneme', ' Nereden Gelir?\r\nYaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır. Virginia\'daki Hampden-Sydney College\'dan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan \'consectetur\' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır. Lorm Ipsum, Çiçero tarafından M.Ö. 45 tarihinde kaleme alınan \"de Finibus Bonorum et Malorum\" (İyi ve Kötünün Uç Sınırları) eserinin 1.10.32 ve 1.10.33 sayılı bölümlerinden gelmektedir. Bu kitap, ahlak kuramı üzerine bir tezdir ve Rönesans döneminde çok popüler olmuştur. Lorem Ipsum pasajının ilk satırı olan \"Lorem ipsum dolor sit amet\" 1.10.32 sayılı bölümdeki bir satırdan gelmektedir.\r\n\r\n1500\'lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.', 'acelya', '2020-05-28 18:09:30', 4, 1, 1, 'https://g.hizliresim.com/alex-pettyfer-02');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mesajlar`
--

CREATE TABLE `mesajlar` (
  `mesaj_id` int(11) NOT NULL,
  `mesaj_baslik` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_aciklama` varchar(1000) COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_gonderen` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_kime` int(11) NOT NULL DEFAULT 0,
  `mesaj_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `mesaj_okunma` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `mesajlar`
--

INSERT INTO `mesajlar` (`mesaj_id`, `mesaj_baslik`, `mesaj_aciklama`, `mesaj_gonderen`, `mesaj_kime`, `mesaj_tarih`, `mesaj_okunma`) VALUES
(2, 'deneme', 'deneme 2 yapıyorum', 'acelya', 2, '2020-05-26 21:36:21', 0),
(5, 'deneme', 'iletisim deneme mesajı', 'anonim', 1, '2020-05-27 19:34:11', 1),
(6, 'deneme', 'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960\'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.', 'acelya', 1, '2020-05-27 19:41:05', 1),
(7, 'deneme resim', '<img src=\"https://g.hizliresim.com/yavru-baykus\"/>\r\n\r\nresim gönderiliyormu kontrol', 'acelya', 1, '2020-05-27 19:46:24', 1),
(8, 'deneme', 'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960\'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.', 'acelya', 1, '2020-05-27 21:02:27', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sabit_sayfalar`
--

CREATE TABLE `sabit_sayfalar` (
  `sayfa_id` int(11) NOT NULL,
  `sayfa_adi` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_aciklama` text COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_tarih` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sabit_sayfalar`
--

INSERT INTO `sabit_sayfalar` (`sayfa_id`, `sayfa_adi`, `sayfa_aciklama`, `sayfa_tarih`) VALUES
(1, 'Duyurular', 'Nereden Gelir?\r\nYaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır. Virginia\'daki Hampden-Sydney College\'dan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan \'consectetur\' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır. Lorm Ipsum, Çiçero tarafından M.Ö. 45 tarihinde kaleme alınan \"de Finibus Bonorum et Malorum\" (İyi ve Kötünün Uç Sınırları) eserinin 1.10.32 ve 1.10.33 sayılı bölümlerinden gelmektedir. Bu kitap, ahlak kuramı üzerine bir tezdir ve Rönesans döneminde çok popüler olmuştur. Lorem Ipsum pasajının ilk satırı olan \"Lorem ipsum dolor sit amet\" 1.10.32 sayılı bölümdeki bir satırdan gelmektedir.\r\n\r\n1500\'lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.', '2020-05-28 22:45:04'),
(2, 'Hakkımda', 'Nereden Gelir?\r\nYaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır. Virginia\'daki Hampden-Sydney College\'dan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan \'consectetur\' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır. Lorm Ipsum, Çiçero tarafından M.Ö. 45 tarihinde kaleme alınan \"de Finibus Bonorum et Malorum\" (İyi ve Kötünün Uç Sınırları) eserinin 1.10.32 ve 1.10.33 sayılı bölümlerinden gelmektedir. Bu kitap, ahlak kuramı üzerine bir tezdir ve Rönesans döneminde çok popüler olmuştur. Lorem Ipsum pasajının ilk satırı olan \"Lorem ipsum dolor sit amet\" 1.10.32 sayılı bölümdeki bir satırdan gelmektedir.\r\n\r\n1500\'lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.', '2020-05-28 22:47:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

CREATE TABLE `uyeler` (
  `uye_id` int(11) NOT NULL,
  `uye_adi` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `uye_sifre` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `uye_eposta` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `uye_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `uye_rutbe` int(11) NOT NULL DEFAULT 0,
  `uye_onay` int(11) NOT NULL DEFAULT 0,
  `uye_hakkimda` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`uye_id`, `uye_adi`, `uye_sifre`, `uye_eposta`, `uye_tarih`, `uye_rutbe`, `uye_onay`, `uye_hakkimda`) VALUES
(1, 'acelya', '81dc9bdb52d04dc20036dbd8313ed055', 'acelyabasak2015@gmail.com', '2020-05-25 00:14:31', 1, 1, 'deneme'),
(2, 'Sena', '2b44928ae11fb9384c4cf38708677c48', 'sena@gmail.com', '2020-05-26 17:43:33', 0, 1, 'admin üye düzenleme'),
(3, 'samet', '81dc9bdb52d04dc20036dbd8313ed055', 'samet@hotmail.com', '2020-05-28 18:47:30', 0, 1, ' panelden ekleme deneme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorumlar`
--

CREATE TABLE `yorumlar` (
  `yorum_id` int(11) NOT NULL,
  `yorum_ekleyen` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `yorum_eposta` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `yorum_mesaj` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `yorum_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `yorum_konu_id` int(11) NOT NULL DEFAULT 0,
  `yorum_onay` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yorumlar`
--

INSERT INTO `yorumlar` (`yorum_id`, `yorum_ekleyen`, `yorum_eposta`, `yorum_mesaj`, `yorum_tarih`, `yorum_konu_id`, `yorum_onay`) VALUES
(1, 'acelya', 'acelyabasak@gmail.com', 'deneme yorumu ', '2020-05-25 16:19:38', 1, 1),
(2, 'acelya', 'acelyabasak2015@gmail.com', 'deneme yorumu2 ', '2020-05-25 16:41:56', 1, 1),
(4, 'acelya', 'acelyabasak2015@gmail.com', 'sjjdksls ', '2020-05-25 22:53:03', 1, 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `konular`
--
ALTER TABLE `konular`
  ADD PRIMARY KEY (`konu_id`);

--
-- Tablo için indeksler `mesajlar`
--
ALTER TABLE `mesajlar`
  ADD PRIMARY KEY (`mesaj_id`);

--
-- Tablo için indeksler `sabit_sayfalar`
--
ALTER TABLE `sabit_sayfalar`
  ADD PRIMARY KEY (`sayfa_id`);

--
-- Tablo için indeksler `uyeler`
--
ALTER TABLE `uyeler`
  ADD PRIMARY KEY (`uye_id`);

--
-- Tablo için indeksler `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD PRIMARY KEY (`yorum_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `konular`
--
ALTER TABLE `konular`
  MODIFY `konu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `mesajlar`
--
ALTER TABLE `mesajlar`
  MODIFY `mesaj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `sabit_sayfalar`
--
ALTER TABLE `sabit_sayfalar`
  MODIFY `sayfa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `uyeler`
--
ALTER TABLE `uyeler`
  MODIFY `uye_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `yorumlar`
--
ALTER TABLE `yorumlar`
  MODIFY `yorum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
