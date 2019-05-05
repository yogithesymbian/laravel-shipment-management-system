<?php
namespace Laraspace\Http\Controllers;

use Laraspace\Tracking;

class DashboardController extends Controller
{
    public function index()
    {
        return redirect()->route('admin.dashboard.basic');
    }

    public function basic()
    {
        /**
         * count datas ['information goods']
         * had been send / still pending
         */
        $pendings = Tracking::where(['keterangan' => 'pending'])->count();
        $shipments = Tracking::where(['keterangan' => 'terkirim'])->count();
        return view('admin.dashboard.basic')->with('pendings', $pendings)->with('shipments', $shipments);
    }

    public function ecommerce()
    {
        return view('admin.dashboard.ecommerce');
    }

    public function finance()
    {
        return view('admin.dashboard.finance');
    }
}
