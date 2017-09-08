<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/6 0006
 * Time: 下午 4:48
 */
namespace app\index\lib\contentsBuild;
use app\index\lib\contentsBuild\contentDirector;
class contentsRender{
    protected $contentDirector;
    public function setUp()
    {
       $this->contentDirector=new contentDirector();
    }
    public function render(contentInterface $contentObj,$params)
    {
        $this->setUp();
        return  $this->contentDirector->build($contentObj,$params);
    }
}