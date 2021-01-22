/****** kitapci database seç ******/
USE kitapci
GO

/****** kategoriEkle isimli bir procedure oluştur ******/
CREATE PROCEDURE  kategoriEkle
	@kategori nvarchar(50)
AS 
BEGIN
	INSERT INTO kategoriler (kategori_adi) VALUES (@kategori)
END
/****** kategoriEkle isimli procedure kullanarak kayıt ekleme ******/
EXEC    kategoriEkle
    @kategori = 'TEST'
GO

/****** kategoriRapor isimli bir procedure oluştur ******/
CREATE PROCEDURE  kategoriRapor
AS 
BEGIN
	SELECT kategoriler.kategori_adi, COUNT(kitaplar.kitap_id) AS kitap_sayisi 
	FROM kitaplar 
	INNER JOIN kategoriler ON kategoriler.kategori_id=kitaplar.kategori_id 
	GROUP BY kategoriler.kategori_adi 
	ORDER by kategoriler.kategori_adi ASC
END
/****** kategoriRapor isimli procedure kullanarak hangi kategoride kaç kitap bulunduğunun raporlanması ******/
EXEC    kategoriRapor
GO

/****** kategoriRapor isimli bir procedure oluştur ******/
CREATE PROCEDURE  bakimYap
AS 
BEGIN
	ALTER INDEX PK_kategoriler ON kategoriler REBUILD
	ALTER INDEX PK_yayinevleri ON yayinevleri REBUILD
	ALTER INDEX PK_yazarlar ON yazarlar REBUILD
	ALTER INDEX PK_kitaplar ON kitaplar REBUILD
END
/****** kategoriRapor isimli procedure kullanarak hangi kategoride kaç kitap bulunduğunun raporlanması ******/
EXEC    bakimYap
GO



