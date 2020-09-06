<?php


namespace App\Http\Controllers\interfaces;


use Illuminate\Contracts\View\View;

interface SinglePageControllerInterface
{
    public function index(): View;
}
