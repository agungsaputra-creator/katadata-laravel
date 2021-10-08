@extends('layouts.v1')
@section("title") Tambah Schedule Detail @endsection
@section('content')

    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Schedule Detail</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard.index') }}">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item"><a href="{{ route('detailschedule.index') }}">Data Schedule Detail</a>
                        </li>
                        <li class="breadcrumb-item active">Tambah</li>
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
                            <form action="{{ route('detailschedule.store') }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf

                                <div class="form-group">
                                    <label for="nama_kategori">Pilih Jadwal</label>
                                    <select class="form-control  @error('schedule_id') is-invalid @enderror" name="schedule_id">
                                        <option value="">Pilih Jadwal</option>
                                        @foreach($schedule_id as $row)
                                            <option value="{{$row->id}}">{{$row->name_day}} - {{\Carbon\Carbon::parse($row->tanggal)->isoFormat('dddd, D MMMM Y')}}</option>
                                        @endforeach
                                    </select>
                                    @error('schedule_id')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                                </div>
                                <div class="form-group">
                                    <label for="nama_kategori">Start Time</label>
                                    <input type="time" name="start_time"
                                        class="form-control  @error('start_time') is-invalid @enderror"
                                        placeholder="Start Time" value="{{ old('start_time') }}">
                                    @error('start_time')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="nama_kategori">End Time</label>
                                    <input type="time" name="end_time"
                                        class="form-control  @error('end_time') is-invalid @enderror"
                                        placeholder="End Time" value="{{ old('end_time') }}">
                                    @error('end_time')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="nama_kategori">Title</label>
                                    <input type="text" name="title"
                                        class="form-control  @error('title') is-invalid @enderror"
                                        placeholder="Title" value="{{ old('title') }}">
                                    @error('title')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="nama_kategori">Link Youtube</label>
                                    <input type="text" name="link_youtube"
                                        class="form-control  @error('link_youtube') is-invalid @enderror"
                                        placeholder="Link Youtube" value="{{ old('link_youtube') }}">
                                    @error('link_youtube')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="nama_kategori">Link Facebook</label>
                                    <input type="text" name="link_facebook"
                                        class="form-control  @error('link_facebook') is-invalid @enderror"
                                        placeholder="Link Facebook" value="{{ old('link_facebook') }}">
                                    @error('link_facebook')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>

                                <div class="form-group">
                                    <label for="nama_kategori">Type</label>
                                    <select name="type" class="form-control">
                                        <option value="">Pilih Type</option>
                                        <option value="keynote_speech" >Keynote Speech</option>
                                        <option value="speaker" >Speaker</option>
                                    </select>
                                    @error('type')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                                </div>

                                <div class="form-group">
                                    <label>Speaker</label>
                                    <select name="speaker_id[]" class="form-control select2" multiple="multiple" data-placeholder="Select a State" style="width: 100%;">

                                        @foreach ($speaker as $row)
                                            <option value="{{$row->id}}">{{$row->name}}</option>
                                        @endforeach
                                    </select>
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
