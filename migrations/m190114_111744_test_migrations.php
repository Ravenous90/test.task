<?php

use yii\db\Migration;

/**
 * Class m190114_111744_test_migrations
 */
class m190114_111744_test_migrations extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('options', [
            'name' => $this->string(255)->notNull(),
            'value' => $this->string(255)->notNull(),
            'description' => $this->text(),
        ]);

//        -----------------------------------
//        $this->createTable('meetings', [
//            'id' => $this->primaryKey(),
//            'title' => $this->string(255)->notNull(),
//            'description' => $this->text()->notNull(),
//            'date' => $this->dateTime(),
//        ]);
//
//        $this->createTable('seats', [
//            'id' => $this->primaryKey(),
//            'coordinate_x' => $this->double()->notNull(),
//            'coordinate_y' => $this->double()->notNull(),
//            'seat_type' => $this->string(255)->notNull(), // тип места (прямоугольная область вокруг точки центра, прописать в модели размеры)
//        ]);
//
//        $this->createTable('relations', [
//            'user_id' => $this->integer()->notNull(),
//            'meeting_id' => $this->integer()->notNull(),
//            'seat_id' => $this->integer()->notNull(),
//            'status' => $this->string(255)->notNull()
//        ]);
//
//        $this->createIndex(
//            'idx-relations-user_id',
//            'relations',
//            'user_id'
//        );
//
//        $this->addForeignKey(
//            'fk-relations-user_id',
//            'relations',
//            'user_id',
//            'users',
//            'id',
//            'CASCADE'
//        );
//
//        $this->createIndex(
//            'idx-relations-meeting_id',
//            'relations',
//            'meeting_id'
//        );
//
//        $this->addForeignKey(
//            'fk-relations-meeting_id',
//            'relations',
//            'meeting_id',
//            'meetings',
//            'id',
//            'CASCADE'
//        );
//        $this->createIndex(
//            'idx-relations-seat_id',
//            'relations',
//            'seat_id'
//        );
//
//        $this->addForeignKey(
//            'fk-relations-seat_id',
//            'relations',
//            'seat_id',
//            'seats',
//            'id',
//            'CASCADE'
//        );
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('options');

//        $this->dropForeignKey(
//            'fk-post-user_id',
//            'relations'
//        );
//
//        $this->dropIndex(
//            'idx-post-user_id',
//            'relations'
//        );
//
//        $this->dropForeignKey(
//            'fk-post-meeting_id',
//            'relations'
//        );
//
//        $this->dropIndex(
//            'idx-post-meeting_id',
//            'relations'
//        );
//
//        $this->dropForeignKey(
//            'fk-post-seat_id',
//            'relations'
//        );
//
//        $this->dropIndex(
//            'idx-post-seat_id',
//            'relations'
//        );
//
//        $this->dropTable('meetings');
//        $this->dropTable('seats');
//        $this->dropTable('relations');
    }


}
