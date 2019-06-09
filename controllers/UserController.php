<?php
/**
 * Created by PhpStorm.
 * User: askolotii
 * Date: 18.09.2018
 * Time: 10:00
 */

namespace app\controllers;

use app\models\Signin;
use app\models\Signup;
use Yii;
use yii\web\Controller;
use app\models\User;

class UserController extends Controller
{
    public function actionSignup()
    {
        $model = new Signup();
        if (isset($_POST['Signup'])) {
            $username = Yii::$app->request->post('Signup')['username'];
            $password = Yii::$app->request->post('Signup')['password'];
            if ($model->signup($username, $password)) {
                return $this->redirect('index');
            }
        }
        return $this->render('signup',['model' => $model]);
    }

    public function actionSignin()
    {
        $model = new Signin();
        if (Yii::$app->session->get('username')) {
            return $this->redirect('index');
        }

        if (isset($_POST['Signin'])) {
            $username = Yii::$app->request->post('Signin')['username'];
            $password = Yii::$app->request->post('Signin')['password'];
                if (Signin::checkAuth($username, $password)) {
                    return $this->redirect('index');
                }
        }
        return $this->render('signin',['model' => $model]);
    }

    public function actionLogout()
    {
        User::logout();
        return $this->redirect(['signin']);
    }

    public function actionIndex()
    {
        if (!Yii::$app->session->get('username')) {
            return $this->redirect('signin');
        } else {
            return $this->render('index');
        }
    }
}