import router from '@ohos.router';
import { BusinessError } from '@ohos.base';

@Preview
@Component
export default struct Home {
  build(){
    Column({ space: 12 }) {
      Column() {
        Text("首页")
          .fontWeight(FontWeight.Medium)
          .fontSize(24)
          .margin({ top: 12 })
          .padding({ left: 12})

        Button(){
          Text("点击")
            .fontWeight(FontWeight.Medium)
            .fontSize(24)
        }
        .type(ButtonType.Capsule)
        .margin({ top: 12 })
        .backgroundColor("#0D9FFB")
        .width("40%")
        .width("5%")
        .onClick(()=>{
          console.debug("Clicked on button");
          router.pushUrl({
            url: "pages/HomeDetailPage"
          }).then(()=>{
            console.info('Succeeded in jumping to the second page.')
          }).catch((error:BusinessError)=>{
            console.debug('Failed to jump to the second page error = %@,message = %@',error.code,error.message)
            console.error(`Failed to jump to the second page.Code is ${error.code}, message is ${error.message}`)
          })
        })

        Image($r("app.media.icon"))
          .objectFit(ImageFit.Cover)
          .interpolation(ImageInterpolation.Medium)//分辨率较低图片显示得更清晰
          .onComplete((event)=>{
            console.debug(`event.width = ${event?.width}`)
          })
          .onError(()=>{
            console.debug('load image fail')
          })


        Text("release_refresh_text")

        Button("按钮1",{type:ButtonType.Circle})
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(90)
          .width(40)

        Button({type:ButtonType.Normal}){
          Row(){
            Image($r('app.media.ic_tab_me_selected')).width(20).height(40).margin({ left: 12 })
            Text("按钮 2").fontSize(12).fontColor(0xffffff).margin({ left: 5, right: 12 })
          }
        }
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .width(40)

        Radio({
          value: "单选框1",
          group:"radioGroup"
        }).checked(false)
          .onChange((isChecked: boolean)=>{
            if (isChecked) {
              console.debug("切换为响铃模式")
            }
          })
        Radio({
          value: "单选框2",
          group:"radioGroup"
        }).checked(true)
        // 切换按钮
        Toggle({type:ToggleType.Checkbox,isOn:true})
        Toggle({type:ToggleType.Checkbox,isOn:false})

        Toggle({type:ToggleType.Switch,isOn:true})
        Toggle({type:ToggleType.Switch,isOn:false})

        Toggle({type:ToggleType.Button,isOn:true}){
          Text("Toggle1").fontColor("#182431").fontSize(20)
        }.width(100)
        Toggle({type:ToggleType.Button,isOn:false}){
          Text("Toggle2").fontColor("#182431").fontSize(20)
        }
        .width(100)
        .selectedColor(Color.Pink)
        .onChange((isOn: boolean) => {
          if (isOn){

          }
        })
      //进度条

        //线性进度条
        Progress({
          value:20,
          total:100,
          type:ProgressType.Linear
        }).width(220).height(50)
        // 水平进度条
        Progress({ value: 20, total: 100, type: ProgressType.Linear }).width(200).height(50)
        // 垂直进度条（高度大于宽度）
        Progress({ value: 20, total: 100, type: ProgressType.Linear }).width(50).height(200)

        //环形无刻度样式进度条
        Progress(
          {
            value: 40,
            total:100,
            type:ProgressType.Ring
          }
        ).width(100).height(100)
          .color(Color.Gray)
          .style({strokeWidth:15})
        //环形有刻度样式进度条
        Progress({value:20,
          total:100,
        type:ProgressType.ScaleRing
        }).width(100).height(100)
          .backgroundColor(Color.Black)
          .style({strokeWidth:15,scaleCount:20,scaleWidth:5})

        // 圆形进度条
        Progress({
          value: 10,
          total:100,
          type: ProgressType.Eclipse
        })
        // 胶囊进度条 ，高度大于宽度 是垂直显示
        Progress({
          value: 10,
          total:100,
          type: ProgressType.Capsule
        })



        Text(){
          Span("我是Span1").fontSize(16).fontColor(Color.Grey)
          Span("我是Span1").fontSize(16).fontColor(Color.Red)
            .decoration({type: TextDecorationType.Underline,color:Color.Blue})
            .textCase(TextCase.UpperCase)//设置文字大写
            .onClick(()=>{
              console.info('我是Span——onClick')
            })
        }
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .gesture(
          TapGesture().onAction(()=>{
            console.info('TapGesture is onAction');
          })//gesture手势绑定方法绑定TapGesture

        )


      }
      .width("100%")
      .alignItems(HorizontalAlign.Center)
    }
  }
}