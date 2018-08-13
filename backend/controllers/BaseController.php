<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use common\models\AccessMenu;

class BaseController extends Controller
{
    public function beforeAction($action)
    {
        $parent = parent::beforeAction($action);

        $this->guestRedirect();
        $this->checkAuth();

        return $parent;
    }

    public function guestRedirect()
    {
        $isGuest = Yii::$app->getUser()->getIsGuest();

        //if ($isGuest && $this->getRoute() != 'site/login') {
        if ($isGuest) {
            $url = Yii::$app->urlManager->createUrl("site/login");
            $this->redirect($url);
        }
    }

    public function checkAuth()
    {
        $userId = Yii::$app->user->identity->getId();
        $action = $this->module->requestedRoute;
        $menus = AccessMenu::getMenu();
        $bool = true;

        foreach ($menus as $k => $v) {
            if ($action == $v["url"][0]) {
                $bool = false;
            }
        }

        if ($bool == true && (false == Yii::$app->user->identity->isRoot())) {
            throw new ForbiddenHttpException();
        }
    }
}