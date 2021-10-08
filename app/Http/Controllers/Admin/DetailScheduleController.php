<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Schedule;
use App\Models\Schedule_detail;
use App\Models\Speaker;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Foundation\Validation\ValidatesRequests;

class DetailScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    use ValidatesRequests;
    public function data(){
        try{
            $data = Schedule_detail::LeftJoin('schedules','schedules.id','=','schedule_details.schedule_id')->select('schedule_details.*','schedules.tanggal as tanggal')->get();
            return datatables()->of($data)
            ->addColumn('schedule', function ($data) {
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
        return view('scheduledetail.index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        $speaker = Speaker::all();
        $schedule_id = Schedule::all();
        return view('scheduledetail.create',compact('schedule_id','speaker'));
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
            'schedule_id' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
            'title' => 'required',
            'type' => 'required',
        ], $messages);

        $detail = new Schedule_detail();
        $detail->schedule_id = $request->get('schedule_id');
        $detail->start_time = $request->get('start_time');
        $detail->end_time = $request->get('end_time');
        $detail->title = $request->get('title');
        $detail->link_youtube = $request->get('link_youtube');
        $detail->link_facebook = $request->get('link_facebook');
        $detail->type = $request->get('type');

        $detail->speaker_id = json_encode($request->get('speaker_id'));
        $detail->save();
        if ($detail) {
            //redirect dengan pesan sukses
            return redirect()->route('detailschedule.index')->with(['success' => 'Data Berhasil Disimpan!']);
        } else {
            //redirect dengan pesan error
            return redirect()->route('detailschedule.index')->with(['error' => 'Data Gagal Disimpan!']);
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
        $speaker = Speaker::all();
        $schedule_id = Schedule::all();
        $scheduledetail = Schedule_detail::findOrFail($id);
        return view('scheduledetail.edit',compact('scheduledetail','schedule_id','speaker'));
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {

        $messages = [
            'required' => 'Kolom Wajib diisi!',
        ];

        $this->validate($request, [
            'schedule_id' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
            'title' => 'required',
            'type' => 'required',
        ], $messages);
        $detail = Schedule_detail::findOrFail($id);
        $detail->schedule_id = $request->get('schedule_id');
        $detail->start_time = $request->get('start_time');
        $detail->end_time = $request->get('end_time');
        $detail->title = $request->get('title');
        $detail->link_youtube = $request->get('link_youtube');
        $detail->link_facebook = $request->get('link_facebook');
        $detail->type = $request->get('type');
        $detail->speaker_id = json_encode($request->get('speaker_id'));
        $detail->save();
        if ($detail) {
            //redirect dengan pesan sukses
            return redirect()->route('detailschedule.index')->with(['success' => 'Data Berhasil Diupdate!']);
        } else {
            //redirect dengan pesan error
            return redirect()->route('detailschedule.index')->with(['error' => 'Data Gagal Diupdate!']);
        }
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
            $scheduledetail = Schedule_detail::findOrFail($id)->delete();
            if ($scheduledetail) {
                return redirect()->route('detailschedule.index')->with(['success' => 'Data Berhasil Dihapus!']);
            } else {
                return redirect()->route('detailschedule.index')->with(['error' => 'Data Gagal Dihapus!']);
            }


    }
}
