<template>
  <div>
    <div>
      <x-header :left-options="{backText: ''}" @click.native='cancelScan' style="background-color:00cc66;" >查看二维码</x-header>
    </div>
    <Row>
    <i-col span="24" style="text-align: center;">
        <div id="code" style="z-index: 99;">
            <canvas id="canvas" style="z-index: 99;"></canvas>
        </div>
    </i-col>
    </Row>
  </div>
</template>
<script  type='text/ecmascript-6'>
import { Datetime, Group, Cell, XHeader, XInput, XButton, TransferDomDirective as TransferDom, Alert, Toast } from 'vux'
    import QRCode from 'qrcode'
  export default{
      data(){
        return{
          codeUrl: '',
          isShow:true,
          id:'',
          courseid:''
        }
      },
      components:{
           Group,
            Cell,
            XHeader,
            XInput,
            XButton,
            Alert,
            Toast,
            Datetime,
            QRCode
        },
      mounted () {
        this.courseid = localStorage.getItem('courseid')
        setTimeout(()=>{
            this.getUrl('http://47.113.124.225/:8080/#/addbk?id='+this.courseid)
        },2000)
      },
      created(){
      },
      methods: {
        getUrl(xxx){

          var canvas=document.getElementById("canvas"); //获取到canvas

          var code=document.getElementById("code");   //获取到code容器

          QRCode.toCanvas(canvas,xxx, error=> {

              if (error) console.error(error);

               console.log("success!");

                });

            var image = new Image();     //实例一个img

            image.src = canvas.toDataURL("image/png");  //转换成base64格式路径的png图片 

            image.style.width = "50%";    //设置样式

            code.appendChild(image);     //添加到code 容器中

            canvas.style.display = "none";   //隐藏掉canvas  

        },
     }
  };
</script>
<style scoped>
 .mui-content{
  padding: 44px 0 60px 0;/*px*/
  box-sizing: border-box;
  margin-top: 60px;/*px*/
}
.scan {
    height: 100%;
}
.scan #bcid {
      width: 100%;
      position: absolute;
      left: 0;
      right: 0;
      top: 50px;/*px*/
      bottom:3rem;
      text-align: center;
      color: #fff;
      background: #ccc;
}
.scan footer {
      position: absolute;
      left: 50%;
      transform: translate(-50%);
      bottom: 1rem;
      width: 100%;
      height: 1rem;
      /*line-height: 2rem;*/
      z-index: 2;
      display: flex;
      justify-content: center;
}
.scan footer button{
  width: 45%;
  font-size: 30px;/*px*/
}
.clickBtn,.cancelBtn{
  margin-top:20px;/*px*/
  width: 150px;/*px*/
  height: 60px;/*px*/
  text-align: center;;
}
.cancelBtn{
  margin-left: 20px;/*px*/
}
</style>