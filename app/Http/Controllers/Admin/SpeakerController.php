<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Speaker;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Auth;

class SpeakerController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    use ValidatesRequests;
    public function data(){
        try{
            $data = Speaker::all();
            return datatables()->of($data)
            ->addColumn('photo', function ($data) {
                $url= asset('photo_speaker/'.$data->photo);
                return '<img src="'.$url.'" border="0" width="150" class="img-rounded" align="center" />';
            })
            ->addIndexColumn()
            ->rawColumns(['photo'])
            ->make(true);
        } catch (Exception $e) {
            DB::commit();
            return response()->json(
                [
                    'status' => false,
                    'message' => $e->getMessage()
                ]
            );
        }
    }
    public function index()
    {
        return view('speaker.index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('speaker.create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $messages = [
            'required' => 'Kolom Wajib diisi!',
        ];

        $this->validate($request, [
            'name' => 'required',
            'jabatan' => 'required'
        ], $messages);

        $speaker = new Speaker();
        $speaker->name = $request->get('name');
        $speaker->jabatan = $request->get('jabatan');

        if ($request->file('photo')) {
            $tujuan_upload = "photo_speaker";
            $image = $request->file('photo');
            $namareplace_ = str_replace(' ', '_', $image->getClientOriginalName());
            $nama_file = time() . "_" . $namareplace_;
            $image->move($tujuan_upload, $nama_file);
            $speaker->photo = $nama_file;
        }
        $speaker->save();
        if ($speaker) {
            //redirect dengan pesan sukses
            return redirect()->route('speaker.index')->with(['success' => 'Data Berhasil Disimpan!']);
        } else {
            //redirect dengan pesan error
            return redirect()->route('speaker.index')->with(['error' => 'Data Gagal Disimpan!']);
        }
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        return view('show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        $speaker = Speaker::findOrFail($id);
        return view('speaker.edit',compact('speaker'));
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        $speaker = Speaker::findOrFail($id);
        $messages = [
            'required' => 'Kolom Wajib diisi!',
        ];

        $this->validate($request, [
            'name' => 'required',
            'jabatan' => 'required',
        ], $messages);
        $speaker->name = $request->get('name');
        $speaker->jabatan = $request->get('jabatan');
        if ($request->file('photo')) {
            $tujuan_upload = "photo_speaker";
            $image = $request->file('photo');
            $namareplace_ = str_replace(' ', '_', $image->getClientOriginalName());
            $nama_file = time() . "_" . $namareplace_;
            $image->move($tujuan_upload, $nama_file);
            $speaker->photo = $nama_file;
        }
        $speaker->save();
        if ($speaker) {
            //redirect dengan pesan sukses
            return redirect()->route('speaker.index')->with(['success' => 'Data Berhasil Diupdate!']);
        } else {
            //redirect dengan pesan error
            return redirect()->route('speaker.index')->with(['error' => 'Data Gagal Diupdate!']);
        }
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
            $speaker =Speaker::findOrFail($id)->delete();
            if ($speaker) {
                return redirect()->route('speaker.index')->with(['success' => 'Data Berhasil Dihapus!']);
            } else {
                return redirect()->route('speaker.index')->with(['error' => 'Data Gagal Dihapus!']);
            }


    }

}
