<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Schedule;
use Carbon\Carbon;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Foundation\Validation\ValidatesRequests;

class ScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    use ValidatesRequests;
    public function data(){
        try{
            $data = Schedule::all();
            return datatables()->of($data)
            ->addColumn('tanggal', function ($data) {
                return Carbon::parse($data->tanggal)->isoFormat('dddd, D MMMM Y');
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
        return view('schedule.index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('schedule.create');
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
            'tanggal' => 'required',
            'name_day' => 'required',
        ], $messages);

        $schedule = new Schedule();
        $schedule->tanggal = $request->get('tanggal');
        $schedule->name_day = $request->get('name_day');
        $schedule->save();
        if ($schedule) {
            //redirect dengan pesan sukses
            return redirect()->route('schedule.index')->with(['success' => 'Data Berhasil Disimpan!']);
        } else {
            //redirect dengan pesan error
            return redirect()->route('schedule.index')->with(['error' => 'Data Gagal Disimpan!']);
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
        $schedule = Schedule::findOrFail($id);
        return view('schedule.edit',compact('schedule'));
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        $schedule = Schedule::findOrFail($id);
        $messages = [
            'required' => 'Kolom Wajib diisi!',
        ];

        $this->validate($request, [
            'tanggal' => 'required',
            'name_day' => 'required',
        ], $messages);
        $schedule->tanggal = $request->get('tanggal');
        $schedule->name_day = $request->get('name_day');
        $schedule->save();
        if ($schedule) {
            //redirect dengan pesan sukses
            return redirect()->route('schedule.index')->with(['success' => 'Data Berhasil Diupdate!']);
        } else {
            //redirect dengan pesan error
            return redirect()->route('schedule.index')->with(['error' => 'Data Gagal Diupdate!']);
        }
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
            $schedule =Schedule::findOrFail($id)->delete();
            if ($schedule) {
                return redirect()->route('schedule.index')->with(['success' => 'Data Berhasil Dihapus!']);
            } else {
                return redirect()->route('schedule.index')->with(['error' => 'Data Gagal Dihapus!']);
            }
    }
}
