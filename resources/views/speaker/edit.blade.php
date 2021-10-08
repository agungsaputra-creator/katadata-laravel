@extends('layouts.v1')
@section("title") Edit Speaker @endsection
@section('content')

    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Speaker</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard.index') }}">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item"><a href="{{ route('speaker.index') }}">Data Speaker</a>
                        </li>
                        <li class="breadcrumb-item active">Edit</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="{{ route('speaker.update',[$speaker->id]) }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf

                                <div class="form-group">
                                    <label for="nama_kategori">Nama Lengkap</label>
                                    <input type="text" name="name"
                                        class="form-control  @error('name') is-invalid @enderror"
                                        placeholder="Nama Lengkap" value="{{ old('name', $speaker->name) }}">
                                    @error('name')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="agent">Jabatan</label>
                                    <input type="text" name="jabatan"
                                        class="form-control  @error('jabatan') is-invalid @enderror"
                                        placeholder="Jabatan" value="{{ old('jabatan',$speaker->jabatan) }}">
                                    @error('jabatan')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <img src="/photo_speaker/{{$speaker->photo}}" alt="{{$speaker->name}}" width="150"><br/>
                                    <label for="agent">Photo</label>
                                    <input type="file" name="photo"
                                        class="form-control"
                                        placeholder="Photo">
                                        <small>Boleh di kosongkan jika tidak ingin dirubah</small>

                                </div>

                                <button class="btn btn-primary" type="submit">Simpan</button>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /.col-md-6 -->

                <!-- /.col-md-6 -->
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
@endsection
