BEGIN

		SELECT
			pegawaiku.*,
			whosend.*,
			jenisbrg.*,
			manifestbig.*,
			tracktarbig.*,
			trck.posisi_brg,
			trck.tgl_pengiriman,
			trck.keterangan
		FROM
			(
								SELECT
					     pg.nama_pegawai,
					     pg.tgl_lahir,
					     pg.gender,
					     pg.no_hp AS 'nomor_pegawai'
					  FROM
 		  	 manifest mn,
 		  	 pegawai pg
					 WHERE
					 		pg.id_pegawai = mn.id_pegawai
					 		AND
 		  mn.id_pegawai
 		  				 IN
 		  				  (
 		  				   SELECT
								pg.id_pegawai
							FROM
								pegawai pg
							WHERE
								pg.gender = 'P'
							AND
								YEAR(pg.tgl_lahir) <= 1998
							)
							AND
	  	 mn.kd_manifest
						 IN
						  (

		SELECT
			trck.kd_manifest
			/*
			,
			trck.posisi_brg,
			trck.tgl_pengiriman,
			trck.keterangan,
			alias.*
			*/
		FROM
		   (
			SELECT
				tr.biaya_packing,
				tr.biaya_asuransi,
				tr.biaya_berat_brg,
				tr.biaya_jrk_kirim,
				(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) as 'Total'
			FROM
				tarif tr
			WHERE
				(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) > 100000
			)alias
			,
			tracking trck
		WHERE
			YEAR(trck.tgl_pengiriman) = 2019
		AND
			trck.keterangan = 'terkirim'
		AND
			trck.id_tarif IN
		(
				SELECT
					tr.id_tarif
				FROM
					tarif tr
				WHERE
					(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) > 100000
		)
						)
			)pegawaiku

			,
			(
					SELECT
						  br.jenis_barang
					  FROM
				barang br
					 WHERE
		br.jenis_barang
						 IN ('Kaca','Plastik')
						AND
			br.id_barang
						 IN
							(

					SELECT
					     mn.id_barang
					  FROM
 		  	 manifest mn
					 WHERE
 		  mn.id_pegawai
 		  				 IN
 		  				  (
 		  				   SELECT
								pg.id_pegawai
							FROM
								pegawai pg
							WHERE
								pg.gender = 'P'
							AND
								YEAR(pg.tgl_lahir) <= 1998
							)
							AND
	  	 mn.kd_manifest
						 IN
						  (

		SELECT
			trck.kd_manifest
			/*
			,
			trck.posisi_brg,
			trck.tgl_pengiriman,
			trck.keterangan,
			alias.*
			*/
		FROM
		   (
			SELECT
				tr.biaya_packing,
				tr.biaya_asuransi,
				tr.biaya_berat_brg,
				tr.biaya_jrk_kirim,
				(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) as 'Total'
			FROM
				tarif tr
			WHERE
				(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) > 100000
			)alias
			,
			tracking trck
		WHERE
			YEAR(trck.tgl_pengiriman) = 2019
		AND
			trck.keterangan = 'terkirim'
		AND
			trck.id_tarif IN
		(
				SELECT
					tr.id_tarif
				FROM
					tarif tr
				WHERE
					(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) > 100000
		)
						)
	)
			)jenisbrg
			,
			(
			SELECT
	pr.no_telpon AS 'nomor_pengirim'
FROM
	pengirim pr
WHERE
	pr.id_pengirim IN
	(
	SELECT
	br.id_pengirim
FROM
	barang br
WHERE
	br.jenis_barang IN ('Kaca','Plastik')
	AND
	br.id_barang IN
	(

					SELECT
					     mn.id_barang
					  FROM
 		  	 manifest mn
					 WHERE
 		  mn.id_pegawai
 		  				 IN
 		  				  (
 		  				   SELECT
								pg.id_pegawai
							FROM
								pegawai pg
							WHERE
								pg.gender = 'P'
							AND
								YEAR(pg.tgl_lahir) <= 1998
							)
							AND
	  	 mn.kd_manifest
						 IN
						  (

		SELECT
			trck.kd_manifest
			/*
			,
			trck.posisi_brg,
			trck.tgl_pengiriman,
			trck.keterangan,
			alias.*
			*/
		FROM
		   (
			SELECT
				tr.biaya_packing,
				tr.biaya_asuransi,
				tr.biaya_berat_brg,
				tr.biaya_jrk_kirim,
				(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) as 'Total'
			FROM
				tarif tr
			WHERE
				(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) > 100000
			)alias
			,
			tracking trck
		WHERE
			YEAR(trck.tgl_pengiriman) = 2019
		AND
			trck.keterangan = 'terkirim'
		AND
			trck.id_tarif IN
		(
				SELECT
					tr.id_tarif
				FROM
					tarif tr
				WHERE
					(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) > 100000
		)
						)
	)
	)
			)whosend
			,
			(
			SELECT
					     mn.kd_manifest
					  FROM
 		  	 manifest mn
					 WHERE
 		  mn.id_pegawai
 		  				 IN
 		  				  (
 		  				   SELECT
								pg.id_pegawai
							FROM
								pegawai pg
							WHERE
								pg.gender = 'P'
							AND
								YEAR(pg.tgl_lahir) <= 1998
							)
							AND
	  	 mn.kd_manifest
						 IN
						  (

		SELECT
			trck.kd_manifest
			/*
			,
			trck.posisi_brg,
			trck.tgl_pengiriman,
			trck.keterangan,
			alias.*
			*/
		FROM
		   (
			SELECT
				tr.biaya_packing,
				tr.biaya_asuransi,
				tr.biaya_berat_brg,
				tr.biaya_jrk_kirim,
				(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) as 'Total'
			FROM
				tarif tr
			WHERE
				(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) > 100000
			)alias
			,
			tracking trck
		WHERE
			YEAR(trck.tgl_pengiriman) = 2019
		AND
			trck.keterangan = 'terkirim'
		AND
			trck.id_tarif IN
		(
				SELECT
					tr.id_tarif
				FROM
					tarif tr
				WHERE
					(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) > 100000
		)
						)

			)manifestbig
			,

		   (
			SELECT
				tr.biaya_packing,
				tr.biaya_asuransi,
				tr.biaya_berat_brg,
				tr.biaya_jrk_kirim,
				(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) as 'Total'
			FROM
				tarif tr
			WHERE
				(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) > 100000
			)tracktarbig
			,
			tracking trck
		WHERE
			YEAR(trck.tgl_pengiriman) = 2019
		AND
			trck.keterangan = 'terkirim'
		AND
			trck.id_tarif IN
		(
				SELECT
					tr.id_tarif
				FROM
					tarif tr
				WHERE
					(tr.biaya_packing + tr.biaya_asuransi + tr.biaya_berat_brg + tr.biaya_jrk_kirim) > 100000
		)
;
END