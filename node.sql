-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 24 Nis 2019, 00:33:09
-- Sunucu sürümü: 10.1.36-MariaDB
-- PHP Sürümü: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `odev`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `album`
--

CREATE TABLE `album` (
  `AlbumId` int(11) NOT NULL,
  `AlbumAdi` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `CikisTarihi` date NOT NULL,
  `SanatciId` int(11) NOT NULL,
  `MuzikTurId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `album`
--

INSERT INTO `album` (`AlbumId`, `AlbumAdi`, `CikisTarihi`, `SanatciId`, `MuzikTurId`) VALUES
(3, 'Sen kötü bir rüyasın', '2019-04-24', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `muziktur`
--

CREATE TABLE `muziktur` (
  `MuzikTurId` int(11) NOT NULL,
  `MuzikTur` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `muziktur`
--

INSERT INTO `muziktur` (`MuzikTurId`, `MuzikTur`) VALUES
(1, 'Rap');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sanatci`
--

CREATE TABLE `sanatci` (
  `SanatciId` int(11) NOT NULL,
  `SanatciAdi` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `SanatciYasiyormu` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `SanatciDogumTarihi` date DEFAULT NULL,
  `EklenmeTarihi` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `sanatci`
--

INSERT INTO `sanatci` (`SanatciId`, `SanatciAdi`, `SanatciYasiyormu`, `SanatciDogumTarihi`, `EklenmeTarihi`) VALUES
(1, 'No.1', 'Evet', '1984-06-04', '2019-04-23 20:54:23.305219');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`AlbumId`),
  ADD KEY `MuzikTurId` (`MuzikTurId`),
  ADD KEY `SanatciId` (`SanatciId`);

--
-- Tablo için indeksler `muziktur`
--
ALTER TABLE `muziktur`
  ADD PRIMARY KEY (`MuzikTurId`);

--
-- Tablo için indeksler `sanatci`
--
ALTER TABLE `sanatci`
  ADD PRIMARY KEY (`SanatciId`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `album`
--
ALTER TABLE `album`
  MODIFY `AlbumId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `muziktur`
--
ALTER TABLE `muziktur`
  MODIFY `MuzikTurId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `sanatci`
--
ALTER TABLE `sanatci`
  MODIFY `SanatciId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`SanatciId`) REFERENCES `sanatci` (`SanatciId`),
  ADD CONSTRAINT `album_ibfk_2` FOREIGN KEY (`MuzikTurId`) REFERENCES `muziktur` (`MuzikTurId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
