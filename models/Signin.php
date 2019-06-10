<?php
/**
 * Created by PhpStorm.
 * User: askolotii
 * Date: 05.09.2018
 * Time: 16:37
 */

namespace app\models;

use yii\base\Model;
use yii\helpers\Json;
use Yii;

class Signin extends Model
{
    public $username;
    public $password;

    public function rules()
    {
        return [
            [ ['username', 'password'], 'required', 'message' => 'Field is required'],
            [ ['username', 'password'], 'string', 'length' => [3, 64],
                'tooShort' => 'Field must contain at least 3 symbols',
                'tooLong' => 'Field must contain no more 64 symbols' ],
            [ 'username', 'trim'],
        ];
    }

    public static function validatePassword($username, $password)
    {
        $userData = User::getOneUserData($username);
        if (!is_null($userData)) {
            if (sha1($password) === $userData['password'] && !User::isBlockTime($username)) {
                User::updateAttemptCount($username);
                return true;
            } else {
                if (User::isAttemptValid($username)) {
                    User::updateCountAttemptsAndDate($username);
                    return Yii::$app->session->setFlash('error', 'Password is incorrect');
                } else {
                    if (User::isBlockTime($username)) {
                        $time = User::getTimeToLogin($username);
                        return Yii::$app->session->setFlash('error', 'You have too many attempts to login. Please, try at ' . $time);
                    } else {
                        User::updateAttemptCount($username, 1);
                        return Yii::$app->session->setFlash('error', 'Password is incorrect');
                    }
                }
            }
        } else {
            return Yii::$app->session->setFlash('error', 'There is no user');
        }
    }

    public static function checkAuth($username, $password)
    {
        $isCheck = self::validatePassword($username, $password);
        if ($isCheck) {
            User::authUser($username);
            return true;
        } else {
            return false;
        }
    }
}