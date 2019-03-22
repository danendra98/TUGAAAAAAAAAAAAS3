<?php
    include'konfigurasi.php';

    $query = mysqli_query($kon, 'select * from customer');
?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>WEB SERVICE</title>
</head>
<body>
    <h2>TUGAS 3</h2>
   1. Data Customer

        
<?php if (mysqli_num_rows($query) > 0) {
    # buat array
    $responsistem = array();
    $responsistem["data"] = array();
    while ($row = mysqli_fetch_array($query)) {?>

<?php
        # kerangka format penampilan data json
        
        $data['id_user'] = $row["id_user"];
        $data['nama'] = $row["nama"];
        $data['status'] = $row["status"];
        $data['nomor_induk'] = $row["nomor_induk"];
        $data['nomor_hp'] = $row["nomor_hp"];
        $data['email'] = $row["email"];
        $data['password'] = $row["password"];
           
        array_push($responsistem["data"], $data);

    }
    echo json_encode($responsistem);
} else {


    #a menmapilkan pesan jika tidak ada data dalam tabel
    $responsistem["message"]="tidak ada data";
    echo json_encode($responsistem);
}?>
    

    
<?php
    include'konfigurasi.php';

    $query = mysqli_query($kon, 'select * from penjual');
?>
<p></p>
   2. Data Penjual

        
<?php if (mysqli_num_rows($query) > 0) {
    # buat array
    $responsistem = array();
    $responsistem["datapenjual"] = array();
    while ($row = mysqli_fetch_array($query)) {?>

<?php
        # kerangka format penampilan datapenjual json
        
        $datapenjual['id_penjual'] = $row["id_penjual"];
        $datapenjual['nama_warung'] = $row["nama_warung"];
        $datapenjual['nama_pemilik'] = $row["nama_pemilik"];
        $datapenjual['nomor_induk'] = $row["nomor_induk"];
        $datapenjual['nomor_hp'] = $row["nomor_hp"];
           
        array_push($responsistem["datapenjual"], $datapenjual);

    }
    echo json_encode($responsistem);
} else {


    # menmapilkan pesan jika tidak ada data dalam tabel
    $responsistem["message"]="tidak ada data";
    echo json_encode($responsistem);
}?>
    

    
<?php
    include'konfigurasi.php';

    $query = mysqli_query($kon, 'select * from makanan');
?>
<p></p>
   3. Data Makanan

        
<?php if (mysqli_num_rows($query) > 0) {
    # buat array
    $responsistem = array();
    $responsistem["datamakanan"] = array();
    while ($row = mysqli_fetch_array($query)) {?>

<?php
        # kerangka format penampilan datamakanan json
        
        $datamakanan['id_makanan'] = $row["id_makanan"];
        $datamakanan['nama'] = $row["nama"];
        $datamakanan['harga'] = $row["harga"];
        $datamakanan['stok'] = $row["stok"];
        $datamakanan['id_penjual'] = $row["id_penjual"];
           
        array_push($responsistem["datamakanan"], $datamakanan);

    }
    echo json_encode($responsistem);
} else {


    # menmapilkan pesan jika tidak ada data dalam tabel
    $responsistem["message"]="tidak ada data";
    echo json_encode($responsistem);
}?>

    
<?php
    include'konfigurasi.php';

    $query = mysqli_query($kon, 'select * from minuman');
?>
<p></p>
   4. Data Minuman

        
<?php if (mysqli_num_rows($query) > 0) {
    # buat array
    $responsistem = array();
    $responsistem["dataminuman"] = array();
    while ($row = mysqli_fetch_array($query)) {?>

<?php
        # kerangka format penampilan dataminuman json
        
        $dataminuman['id_minuman'] = $row["id_minuman"];
        $dataminuman['nama'] = $row["nama"];
        $dataminuman['harga'] = $row["harga"];
        $dataminuman['stok'] = $row["stok"];
        $dataminuman['id_penjual'] = $row["id_penjual"];
           
        array_push($responsistem["dataminuman"], $dataminuman);

    }
    echo json_encode($responsistem);
} else {


    # menmapilkan pesan jika tidak ada data dalam tabel
    $responsistem["message"]="tidak ada data";
    echo json_encode($responsistem);
}?>


<?php
    include'konfigurasi.php';

    $query = mysqli_query($kon, 'select * from snack');
?>
<p></p>
    5. Data Snack

        
<?php if (mysqli_num_rows($query) > 0) {
    # buat array
    $responsistem = array();
    $responsistem["datasnack"] = array();
    while ($row = mysqli_fetch_array($query)) {?>

<?php
        # kerangka format penampilan datasnack json
        
        $datasnack['id_snack'] = $row["id_snack"];
        $datasnack['nama'] = $row["nama"];
        $datasnack['harga'] = $row["harga"];
        $datasnack['stok'] = $row["stok"];
        $datasnack['id_penjual'] = $row["id_penjual"];
           
        array_push($responsistem["datasnack"], $datasnack);

    }
    echo json_encode($responsistem);
} else {


    # menmapilkan pesan jika tidak ada data dalam tabel
    $responsistem["message"]="tidak ada data";
    echo json_encode($responsistem);
}?>


    </table>
    </body>
</html>