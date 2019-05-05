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
        $trackings = Tracking::where(['keterangan' => 'pending'])->count();
        return view('admin.dashboard.basic')->with('trackings', $trackings);
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
