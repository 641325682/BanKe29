<template>
  <div>
    <!-- <van-button type="primary" size="large" @click.native='cancelScan'>扫一扫</van-button> -->
    <div>
      <x-header :left-options="{backText: ''}" @click.native='cancelScan' style="background-color: #00cc66;">扫一扫</x-header>
    </div>
    <div class="mui-content">
      <div class="scan">
        <div id="bcid">
          <div class="content"></div>
          <p class="tip">...载入中...</p>
        </div>
      </div>
    </div>
  </div>
</template>
<script  type='text/ecmascript-6'>
import { Datetime, Group, Cell, XHeader, XInput, XButton, TransferDomDirective as TransferDom, Alert, Toast } from 'vux'

  let scan = null;
  //点手机虚拟返回键
     document.addEventListener("plusready", function() {
        // 注册返回按键事件
        plus.key.addEventListener('backbutton', function() {
            // 事件处理
            scan.close();//关闭条码识别控件
            window.history.back();
        }, false);
    });
  export default{
      data(){
        return{
          codeUrl: '',
          isShow:true,
          id:''
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
        },
      mounted () {
        this.startScan()//进入页面就调取扫一扫
      },
      created(){
        this.startRecognize();
        this.startScan();
      },
      methods: {
      //创建扫描控件
      getUrl(xxx){

            var canvas=document.getElementById("canvas"); //获取到canvas

            var code=document.getElementById("code");   //获取到code容器

            QRCode.toCanvas(canvas,xxx, error=> {

                if (error) console.error(error);

                 console.log("success!");

                  });

              var image = new Image();     //实例一个img

              image.src = canvas.toDataURL("image/png");  //转换成base64格式路径的png图片 

              image.style.width = "100%";    //设置样式

              code.appendChild(image);     //添加到code 容器中

              canvas.style.display = "none";   //隐藏掉canvas  

       },
      startRecognize() {
        let that = this;
        if (!window.plus) return;
        that.isShow=false;
        // 创建条码扫描识别控件
        scan = new plus.barcode.Barcode('bcid');
        // 条码识别成功
        scan.onmarked = onmarked;
        function onmarked(type, result, file) {
          switch (type) {
            case plus.barcode.QR:
              type = 'QR';
              break;
            case plus.barcode.EAN13:
              type = 'EAN13';
              break;
            case plus.barcode.EAN8:
              type = 'EAN8';
              break;
            default:
              type = '其它' + type;
              break;
          }
          result = result.replace(/\n/g, '');
          that.codeUrl = result;//扫描后返回值
          var id = result.split('=')
          that.id = id[1]
          scan.cancel();//关闭扫描
          scan.close();//关闭条码识别控件
          if(that.codeUrl){
            that.isShow=true
          }
          that.togUrl(id[1])
        }
      },
      togUrl(id){
        this.$router.push('/addbk?id='+id)
      },
      //开始扫描
      startScan() {
        if (!window.plus) return;
        this.startRecognize()//创建控件
        scan.start();
      },

      cancelScan(){
        console.log(11111111);
        this.isShow=true;
        scan.cancel();//关闭扫描
        scan.close();//关闭条码识别控件
      }
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