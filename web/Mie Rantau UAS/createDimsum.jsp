<%-- 
    Document   : createDimsum
    Created on : 1 Jul 2024, 01.41.54
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tambah Dimsum</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="shadow-lg p-2 br-4">
                    <h1 class="text-center mb-4">Menambahkan Dimsum</h1>
                    <form>
                        <div class="mb-3">
                            <label for="nama" class="form-label">Nama Dimsum</label>
                            <input type="text" class="form-control" id="nama" aria-describedby="namaHelp" placeholder="Masukkan nama dimsum">
                        </div>
                        <div class="mb-3">
                            <label for="deskripsi" class="form-label">Deskripsi</label>
                            <textarea class="form-control" id="deskripsi" rows="3" placeholder="Masukkan deskripsi dimsum"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="harga" class="form-label">Harga</label>
                            <input type="text" class="form-control" id="harga" placeholder="Masukkan harga dimsum">
                        </div>
                        <div class="mb-3">
                            <label for="photo_url" class="form-label">URL Foto</label>
                            <input type="text" class="form-control" id="photo_url" placeholder="Masukkan URL foto dimsum">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
