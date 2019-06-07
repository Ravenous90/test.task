<h1>Sign in page</h1>
<?php
use yii\widgets\ActiveForm;
use yii\helpers\Html;

/* @var $signin_model \app\models\Signin */
?>

<?php
$form = ActiveForm::begin(['options' => ['class' => 'signin_form']]);
?>

<?= $form->field($signin_model, 'username')->textInput(['autofocus' => false]) ?>
<?= $form->field($signin_model, 'password')->passwordInput() ?>

<div class="form_btns">
    <button type="submit" class="btn btn-success action-btn">Sign in</button>
    <?= Html::a('Sign up', ['user/signup'], ['class' => 'second_btn']) ?>
</div>

<?php
ActiveForm::end()
?>
