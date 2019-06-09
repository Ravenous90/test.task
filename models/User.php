<?php

namespace app\models;

use yii\db\ActiveRecord;
use yii\web\IdentityInterface;
use yii\base\NotSupportedException;
use Yii;
use yii\helpers\Json;

class User
{

    private $password;

    private static function getAuthFilePath()
    {
        return Yii::getAlias('@webroot') . '/users.json';
    }

    private static function getUsersArr()
    {
        return Json::decode(file_get_contents(self::getAuthFilePath()));
    }

    public static function tableName()
    {
        return 'users';
    }

    public function rules()
    {
        return [
            [['username', 'password'], 'required'],
            [['isActive'], 'integer'],
            [['username', 'password'], 'string', 'max' => 255],
        ];
    }

    public static function saveUser($data)
    {
        $usersArr = self::getUsersArr();
        $usersArr[$data['username']] = [
            'password' => $data['password'],
            'time_signin' => date('Y-m-d H:i:s'),
            'attempt_count' => 0
        ];

        if (file_put_contents(self::getAuthFilePath(), Json::encode($usersArr))) {
            $session = Yii::$app->session;
            $session['username'] = $data['username'];
            return true;
        } else {
            return false;
        }
    }

    public static function authUser($username)
    {
        return Yii::$app->session['username'] = $username;
    }

    public static function logout()
    {
        return Yii::$app->session->remove('username');
    }

    public static function getOneUserData($username)
    {
        $usersArr = self::getUsersArr();
        if (array_key_exists($username, $usersArr)) {
            return $usersArr[$username];
        } else {
            return null;
        }
    }

    public static function updateCountAttemptsAndDate($username)
    {
        $res = false;
        $usersArr = self::getUsersArr();
        $userArr = self::getOneUserData($username);
        if (!is_null($userArr)) {
            $usersArr[$username] = [
                'password' => $userArr['password'],
                'time_signin' => date('Y-m-d H:i:s'),
                'attempt_count' => $userArr['attempt_count'] + 1,
            ];
            if (file_put_contents(self::getAuthFilePath(), Json::encode($usersArr))) {
                $res = true;
            }
        }
        return $res;
    }

    public static function isAttemptValid($username)
    {
        $userArr = self::getOneUserData($username);
        if (!is_null($userArr) && $userArr['attempt_count'] < 3) {
            return true;
        } else {
            return false;
        }
    }

    public static function isBlockTime($username)
    {
        $userArr = self::getOneUserData($username);
        if (!is_null($userArr)) {
            return date('Y-m-d H:i:s', strtotime('- 5 min')) < date('Y-m-d H:i:s', strtotime($userArr['time_signin']));
        } else {
            return false;
        }
    }

    public static function getTimeToLogin($username)
    {
        $userArr = self::getOneUserData($username);
        if (!is_null($userArr)) {
            return date('H:i:s', strtotime($userArr['time_signin'] . '+ 5 minutes'));
        } else {
            return null;
        }
    }

    public static function updateAttemptCount($username, $count = 0)
    {
        $res = false;
        $usersArr = self::getUsersArr();
        $userArr = self::getOneUserData($username);

        $usersArr[$username] = [
            'password' => $userArr['password'],
            'time_signin' => date('Y-m-d H:i:s'),
            'attempt_count' => $count,
        ];
        if (file_put_contents(self::getAuthFilePath(), Json::encode($usersArr))) {
            $res = true;
        }
        return $res;
    }
}
