<?php
/**
 * Created by PhpStorm.
 * User: askolotii
 * Date: 05.09.2018
 * Time: 15:15
 */

namespace app\models;

use yii\base\Model;
use Yii;

class Signup extends Model
{
    public $username;
    public $email;
    public $password;

    public function rules()
    {
        return [
            [ ['username', 'password'], 'required', 'message' => 'Field is required'],
            [ ['username'], 'unique' , 'targetClass' => 'app\models\User', 'message' => 'This user has been already registered'],
            [ ['username', 'password'], 'string', 'length' => [3, 64],
                'tooShort' => 'Field must contain at least 3 symbols',
                'tooLong' => 'Field must contain no more 64 symbols' ],
            [ 'username', 'trim']
        ];
    }

    public function signup($username, $password)
    {
        $pass = sha1($password);

        $data = [
            'username' => $username,
            'password' => $pass
        ];
        if (User::saveUser($data)){
            return true;
        } else {
            return Yii::$app->session->setFlash('error', 'There is account with this username');
        }
    }

}