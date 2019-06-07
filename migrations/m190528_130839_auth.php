<?php

use yii\db\Migration;

/**
 * Class m190528_130839_auth
 */
class m190528_130839_auth extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('users', [
            'id' => $this->primaryKey(),
            'username' => $this->string(255)->notNull(),
            'email' => $this->string(255)->notNull(),
            'password' => $this->string(255)->notNull(),
            'role' => $this->string(255)->defaultValue('user'),
            'isActive' => $this->integer(1)->defaultValue(0),
            'authKey' => $this->string(255),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('users');
    }

}
