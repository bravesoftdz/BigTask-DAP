(*
Name 		: Muhammad Paridudin Zia
NIM 		: 1301164296
Class 		: IF 40-10
Tubes 		: Peminjaman Bank (DAP)
University	: Telkom University
Majors 		: S1 Informatics Engineering
*)

Program Aplikasi_Pinjaman;
uses crt;

TYPE
	DataNasabah = record
	NoRekening    : integer;
	SaldoPinjaman : longint;
	BayarBerapaKali : longint;
	CicilanSatuKaliBayar : longint;
	Tanggal : integer;
	Nominal : longint;
	cicilanKe : integer;
end;
	
TYPE DaftarNasabah = array[1..10] of integer;

TYPE
	dataPinjam = record
	rekNasabah : longint;
	TsaldoPinjaman,totalYgsudahDiBayar,cicilan : longint;
	TsaldoPinjaman2:longint;
	listCicilan : longint;
	noreks,angkacicilan  : integer;
end;
	
VAR
	// listHistory : array[1..10] of longint;
	DPinjam : dataPinjam;
	//DaftarNasabah : array[1..100] of integer;
	DNasabah : DataNasabah;
	DafNasabah : DaftarNasabah;
	saldoAwal : longint;
	hasilByr : longint;
	pilihan : char;
	j,i:integer;
	
	// menu 
	procedure historyPeminjaman(var DataN:DaftarNasabah; var DetNasabah:DataNasabah; var DtaPinjaman:dataPinjam); forward;
	procedure bayarSatuKaliCicilan(var DataN:DaftarNasabah; var DetNasabah:DataNasabah; var DtaPinjaman:dataPinjam); forward;
	procedure bayarCicilanEkstra(var DataN:DaftarNasabah; var DetNasabah:DataNasabah; var DtaPinjaman:dataPinjam); forward;
	procedure meminjam(var DataN:DaftarNasabah; var DetNasabah:DataNasabah; var DtaPinjaman:dataPinjam); forward;
	
	// sorting data nasabah
	//procedure allNasabah(var DataN:DaftarNasabah; var DetNasabah:DataNasabah; var DtaPinjaman:dataPinjam);
	procedure allNasabah(var DataN:DaftarNasabah);
	var
		i,j,tmp:integer;
	begin
		for i := 1 to 5 - 1 do
		begin
			for j := 5 downto i + 1 do
			begin
			  if DataN[j] < DataN[j-1] then
			  begin
			   tmp := DataN[j];
			   DataN[j] := DataN[j-1];
			   DataN[j-1] := tmp;
			  end;
			end;
		end;
		
		// batas akhir script sorting data nasabah
	
	writeln();
	writeln();
	// menampilkan data nasabah secara urut
	writeln('Daftar Nasabah');
	writeln('====================');
	write('No || ');  write('No.Rekening');
	writeln();
	writeln('====================');
	for j := 1 to 5 do
	
		writeln(j,'. ',' ',' ' , ' ', ' ', DafNasabah[j]);
		
		writeln();
		writeln();
					
			write('Masukan Pilihan = '); readln(pilihan);
			if pilihan = '1' then
			begin
				meminjam(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '2' then
			begin
				bayarSatuKaliCicilan(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '3' then
			begin
				bayarCicilanEkstra(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '4' then
			begin
				historyPeminjaman(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '5' then
			begin
				//allNasabah(DafNasabah,DNasabah,DPinjam)
				allNasabah(DafNasabah)
			end
			else
			begin
				writeln('Angka tidak valid!!!!!');
			end;
		
	end;
	
	// procedure untuk history peminjaman
	procedure historyPeminjaman(var DataN:DaftarNasabah; var DetNasabah:DataNasabah; var DtaPinjaman:dataPinjam);
	var
		i,j:integer;
	begin
	// write();
	writeln();
	writeln('Daftar History Peminjaman Seorang Nasabah ', DtaPinjaman.noreks);
	writeln('===============================================');
	for i := 1 to 1 do
		write('Saldo Pinjaman ||');  write('Total Pembayaran ||'); write('List Cicilan ');
		writeln();
		write('============== || ');  write('=============== ||'); write('============= ');
		writeln();
		write(DtaPinjaman.TsaldoPinjaman2,' ',' ',' ', ' ', ' ',' ', ' ', ' ',' ', ' ', ' ', ' ',' ', ' ', ' '); write('');
		write(DtaPinjaman.totalYgsudahDiBayar,' ',' ',' ', ' ', ' ',' ', ' ', ' ', ' ',' ', ' ', ' ', ' ', ' ');
		write(''); write(DtaPinjaman.listCicilan);
		
		writeln();
		writeln();
					
			write('Masukan Pilihan = '); readln(pilihan);
			if pilihan = '1' then
			begin
				meminjam(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '2' then
			begin
				bayarSatuKaliCicilan(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '3' then
			begin
				bayarCicilanEkstra(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '4' then
			begin
				historyPeminjaman(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '5' then
			begin
				//allNasabah(DafNasabah,DNasabah,DPinjam)
				allNasabah(DafNasabah)
			end
			else
			begin
				writeln('Angka tidak valid!!!!!');
			end;
		
	end;
	
	procedure bayarSatuKaliCicilan(var DataN:DaftarNasabah; var DetNasabah:DataNasabah; var DtaPinjaman:dataPinjam);
	var
		i,n,RekNasabah, banyak : integer;
		jmlDibayarkan , hasilByr: longint;
	begin
		write('Masukan No.Rek Nasabah = '); readln(RekNasabah);
		write('Masukan Jumlah Semua Nasabah = '); readln(banyak); // metode searcing data nasabah
		for i := 1 to n do	
			//if (RekNasabah = DataN[i]) AND (DtaPinjaman.noreks = RekNasabah) then
			if RekNasabah = DataN[i] then
			begin
			  if DtaPinjaman.noreks = RekNasabah then
			  begin
				//write('Masukan nominal cicilan Rp : '); readln(DetNasabah.Nominal);
				write('Anda akan melakukan pembayaran cicilan untuk 1x bayar Rp : '); readln(DetNasabah.CicilanSatuKaliBayar);
				hasilByr := DtaPinjaman.TsaldoPinjaman - DetNasabah.CicilanSatuKaliBayar;
				// untuk menyimpan data ke array history
				DtaPinjaman.TsaldoPinjaman := hasilByr;
				DtaPinjaman.TsaldoPinjaman2 := DetNasabah.CicilanSatuKaliBayar; // untuk saldo pinjaman
				DtaPinjaman.totalYgsudahDiBayar := DetNasabah.CicilanSatuKaliBayar;
				DtaPinjaman.listCicilan := DetNasabah.CicilanSatuKaliBayar;
				// end history
				//writeln(DtaPinjaman.TsaldoPinjaman); // data test
				writeln('Jumlah cicilan anda setelah pembayaran Rp : ' , hasilByr);
			  end // untuk if kedua
			  else
			  begin
				writeln('No Rekening Nasabah Tidak Valid!');
			  end // untuk else pertama
			end;// untuk if pertama
				
				// =============================================== MENU ===========
				
			writeln();
					
			write('Masukan Pilihan = '); readln(pilihan);
			if pilihan = '1' then
			begin
				meminjam(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '2' then
			begin
				bayarSatuKaliCicilan(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '3' then
			begin
				bayarCicilanEkstra(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '4' then
			begin
				historyPeminjaman(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '5' then
			begin
				//allNasabah(DafNasabah,DNasabah,DPinjam)
				allNasabah(DafNasabah)
			end
			else
			begin
				writeln('Angka tidak valid!!!!!');
			end;
				
	end;	
	
	procedure bayarCicilanEkstra(var DataN:DaftarNasabah; var DetNasabah:DataNasabah; var DtaPinjaman:dataPinjam);
	var
		i,n,RekNasabah, banyak,cicilankeberapa,angkacicil : integer;
		jmlDibayarkan , hasilByr: longint;
	begin
		write('Masukan No.Rek Nasabah = '); readln(RekNasabah);
		write('Masukan Jumlah Semua Nasabah = '); readln(banyak);
		for i := 1 to n do
			if RekNasabah = DataN[i] then
			begin
			  if DtaPinjaman.noreks = RekNasabah then
			  begin
				//write('Masukan nominal cicilan Rp : '); readln(DetNasabah.Nominal);
				write('Masukan cicilan ke berapa : '); readln(angkacicil);
				write('Pembayaran cicilan dilakukan minimal 3x, Masukan Nominal cicilan Rp : '); readln(DetNasabah.BayarBerapaKali);
				 // array untuk nampung list cicilan agar tidak tertimpuk
				 //DataCicilan[angkacicil] := DetNasabah.BayarBerapaKali;
				 hasilByr := DtaPinjaman.TsaldoPinjaman - DetNasabah.BayarBerapaKali;
				 DtaPinjaman.TsaldoPinjaman := hasilByr;
				 DtaPinjaman.TsaldoPinjaman2 := DetNasabah.BayarBerapaKali;
				 DtaPinjaman.totalYgsudahDiBayar := DetNasabah.BayarBerapaKali;
				 DtaPinjaman.listCicilan := DetNasabah.BayarBerapaKali;
				 //writeln(DtaPinjaman.TsaldoPinjaman); // data test
				 writeln('Jumlah cicilan anda setelah pembayaran Rp : ' , hasilByr);
				end // untuk if kedua
			  else
			  begin
				writeln('No Rekening Nasabah Tidak Valid!');
			  end // untuk else
			end; // untuk if pertama
				
				// =============================================== MENU ===========
				
					
			writeln();
			write('Masukan Pilihan = '); readln(pilihan);
			
			if pilihan = '1' then
			begin
				meminjam(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '2' then
			begin
				bayarSatuKaliCicilan(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '3' then
			begin
				bayarCicilanEkstra(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '4' then
			begin
				historyPeminjaman(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '5' then
			begin
				//allNasabah(DafNasabah,DNasabah,DPinjam)
				allNasabah(DafNasabah)
			end
			else
			begin
				writeln('Angka tidak valid!!!!!');
			end;
				
	end;	
	
	procedure meminjam(var DataN:DaftarNasabah; var DetNasabah:DataNasabah; var DtaPinjaman:dataPinjam);
	var
		jmlDipinjam,jmlygakandipinjam,hasil : longint;
		RekNasabah, banyak,i,j:integer;
		pilihan:char;
	begin
		write('Masukan No.Rek Nasabah = '); readln(RekNasabah);
		write('Masukan Jumlah Semua Nasabah = '); readln(banyak);
		for i := 1 to banyak do
			if RekNasabah = DataN[i] then
			begin
			 write('Masukan jumlah yang pernah dipinjam Rp : '); readln(jmlDipinjam);
			 if jmlDipinjam = 0 then
			 begin
					write('Masukan jumlah uang yg akan dipinjam Rp : '); readln(jmlygakandipinjam);
					hasil := DetNasabah.SaldoPinjaman + jmlygakandipinjam;
					write('Masukan Nominal Cicilan Rp : '); readln(DetNasabah.Nominal);
					DtaPinjaman.cicilan := DetNasabah.Nominal;
					DtaPinjaman.noreks := RekNasabah;
					DtaPinjaman.TsaldoPinjaman := hasil;
					DtaPinjaman.TsaldoPinjaman2 := hasil;
					//writeln(DtaPinjaman.TsaldoPinjaman);
					writeln('Saldo Pinjaman Anda Sekarang Adalah Rp : ' , hasil);
					//writeln('Saldo Pinjaman Anda Sekarang Adalah Rp : ' , DetNasabah.SaldoPinjaman);
			
			 end // end if kedua
			 else
			 begin
				writeln('Peminjaman hanya bisa dilakukan oleh nasabah yg tidak mepunyai pinjaman!');
			 end // end untuk else
			end; // end if pertama
			
	// ================================================================= MENU =================
			writeln();
			
			write('Masukan Pilihan = '); readln(pilihan);
			if pilihan = '1' then
			begin
				meminjam(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '2' then
			begin
				bayarSatuKaliCicilan(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '3' then
			begin
				bayarCicilanEkstra(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '4' then
			begin
				historyPeminjaman(DafNasabah,DNasabah,DPinjam)
			end
			else if pilihan = '5' then
			begin
				//allNasabah(DafNasabah,DNasabah,DPinjam)
				allNasabah(DafNasabah)
			end
			else
			begin
				writeln('Angka tidak valid!!!!!');
			end;
			
	end;

begin
	clrscr;
	
	// Sample Daftar nasabah yg sudah tersedia
	DafNasabah[1]:= 1123; // 1123 = no rekening
	DafNasabah[2]:= 3454;
	DafNasabah[3]:= 5656;
	DafNasabah[4]:= 2209;
	DafNasabah[5]:= 4302;
	
	
	writeln('========== Program Peminjaman Bank ==========');
	writeln('=============================================');
	writeln('1. Melakukan Peminjaman Uang');
	writeln('2. Melakukan Pembayaran Cicilan 1x');
	writeln('3. Melakukan Pembayaran cicilan Ekstra');
	writeln('4. Print histori pinjaman Nasabah Tertentu');
	writeln('5. Tampilkan Data Nasabah Berdasarkan Saldo Pinjaman');
	writeln();
	
	write('Masukan Pilihan = '); readln(pilihan);
	
	if pilihan = '1' then
	begin
		meminjam(DafNasabah,DNasabah,DPinjam)
	end
	else if pilihan = '2' then
	begin
		bayarSatuKaliCicilan(DafNasabah,DNasabah,DPinjam)
	end
	else if pilihan = '3' then
	begin
		bayarCicilanEkstra(DafNasabah,DNasabah,DPinjam)
	end
	else if pilihan = '4' then
	begin
		historyPeminjaman(DafNasabah,DNasabah,DPinjam)
	end
	else if pilihan = '5' then
	begin
		//allNasabah(DafNasabah,DNasabah,DPinjam)
		allNasabah(DafNasabah)
	end
	else
	begin
		writeln('Angka tidak valid!!!!!');
	end;
		
	readln;
end.

(*
PAKAI ARRAY UNTUK MENAMPUNG LIST CICILAN , AGAR DATA TIDAK DI TIBAN OLEH DATA LAINYA
JADI KETIKA BAYAR CICILAN KE 1 DIMASUKAN KE ARRAY BEGITUPUN DENGAN BERIKUTNYA. DAN
NANTI TINGGAL DITAMPILKAN

FITUR-FITUR YG MASIH KURANG/BELUM SEMPURNA :
=====================================================
- JUMLAH CICILAN DIBAYARKAN MINIMAL 3X CICILAN = di skip
- LIST CICILAN UNTUK BAYAR CICILAN EKSTRA
- DAFTAR NASABAH TERURUT BERDASARKAN SALDO PINJAMAN
- PEMBERITAHUAN KETIKA NO.REK NASABAH TIDAK ADA
*)