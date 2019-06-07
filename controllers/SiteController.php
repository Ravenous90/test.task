<?php

namespace app\controllers;

use yii\filters\AccessControl;
use yii\web\Controller;

class SiteController extends Controller
{
    public function actionIndex()
    {
//        return $this->render('index');
        return $this->redirect('user/signin');
    }

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['signin', 'logout', 'signup'],
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['signin', 'signup'],
                        'roles' => ['?'], // guest
                    ],
                    [
                        'allow' => true,
                        'actions' => ['logout'],
                        'roles' => ['@'], // auth user
                    ],
                ],
            ],
        ];
    }

    public function actionError()
    {
        return $this->render('error');
    }
}
