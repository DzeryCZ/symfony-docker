<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

/**
 * Class IndexController
 */
class IndexController extends Controller
{
    /**
     * Main controller method
     */
    public function index()
    {
        $delta = $this->getLoadingTime();

        return $this->render('index/index.html.twig', array(
            'delta' => $delta,
        ));
    }

    /**
     * Getting loading time
     */
    private function getLoadingTime()
    {
        return number_format(microtime(true) - $_SERVER['REQUEST_TIME_FLOAT'], 3);
    }
}