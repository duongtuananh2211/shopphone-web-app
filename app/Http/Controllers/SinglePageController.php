<?php


namespace App\Http\Controllers;


use App\Http\Controllers\interfaces\SinglePageControllerInterface;
use Illuminate\Contracts\View\View;

class SinglePageController implements SinglePageControllerInterface
{

    public function index(): View
    {
        return view('app');
    }
}
